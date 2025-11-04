
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/pokemon_list_item.dart';
import '../../domain/repositories/pokemon_repository.dart' as repo;
import '../../domain/usecases/load_pokemon_list_usecase.dart';
import '../../data/repositories/pokemon_repository_impl.dart';
import '../../../../core/data/gateways/pokemon_list_gateway.dart';
import '../../../../core/data/gateways/pokemon_detail_gateway.dart';

/// State for the listing presenter
class ListingState {
  final bool isLoading;
  final List<PokemonListItem> pokemon;
  final String? error;

  const ListingState({
    this.isLoading = false,
    this.pokemon = const [],
    this.error,
  });

  ListingState copyWith({
    bool? isLoading,
    List<PokemonListItem>? pokemon,
    String? error,
  }) {
    return ListingState(
      isLoading: isLoading ?? this.isLoading,
      pokemon: pokemon ?? this.pokemon,
      error: error ?? this.error,
    );
  }
}

/// State class for filter management
class FilterState {
  final Set<String> selectedTypes;
  final bool isFilterApplied;

  const FilterState({
    this.selectedTypes = const {},
    this.isFilterApplied = false,
  });

  FilterState copyWith({
    Set<String>? selectedTypes,
    bool? isFilterApplied,
  }) {
    return FilterState(
      selectedTypes: selectedTypes ?? this.selectedTypes,
      isFilterApplied: isFilterApplied ?? this.isFilterApplied,
    );
  }

  bool get hasActiveFilters => selectedTypes.isNotEmpty;

  @override
  String toString() {
    return 'FilterState(selectedTypes: $selectedTypes, isFilterApplied: $isFilterApplied)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FilterState &&
        other.selectedTypes == selectedTypes &&
        other.isFilterApplied == isFilterApplied;
  }

  @override
  int get hashCode => selectedTypes.hashCode ^ isFilterApplied.hashCode;
}

/// Presenter for listing feature using Riverpod
class ListingPresenter {
  final LoadPokemonListUseCase _loadPokemonListUseCase;

  ListingPresenter(this._loadPokemonListUseCase);

  Future<Result<List<PokemonListItem>, String>> loadData() async {
    return await _loadPokemonListUseCase.execute(
      repo.LoadPokemonListParams(limit: 20, offset: 0),
    );
  }
}

/// Provider for the listing presenter
final listingPresenterProvider = Provider<ListingPresenter>((ref) {
  // This would normally be injected, but for simplicity we'll create it here
  // In a real app, you'd use a dependency injection framework
  final repository = ref.watch(pokemonRepositoryProvider);
  final useCase = LoadPokemonListUseCase(repository);
  return ListingPresenter(useCase);
});

/// Provider for the pokemon repository
final pokemonRepositoryProvider = Provider<repo.PokemonRepository>((ref) {
  // Create the repository implementation with required gateways
  return PokemonRepositoryImpl(
    pokemonListGateway: PokemonListGateway(),
    pokemonDetailGateway: PokemonDetailGateway(),
  );
});

/// Provider for filter state
final filterProvider = NotifierProvider<FilterNotifier, FilterState>(FilterNotifier.new);

/// Provider for filtered Pokemon list
/// This will be used to combine the original list with filter state
final filteredPokemonProvider = NotifierProvider<FilteredPokemonNotifier, AsyncValue<List<PokemonListItem>>>(FilteredPokemonNotifier.new);

class FilteredPokemonNotifier extends Notifier<AsyncValue<List<PokemonListItem>>> {
  @override
  AsyncValue<List<PokemonListItem>> build() {
    // Watch for changes in filter state and original pokemon list
    ref.listen(filterProvider, (previous, next) {
      _updateFilteredList();
    });

    ref.listen(pokemonListProvider, (previous, next) {
      _updateFilteredList();
    });

    return const AsyncValue.loading();
  }

  void _updateFilteredList() {
    final filterState = ref.read(filterProvider);
    final pokemonAsync = ref.read(pokemonListProvider);

    state = pokemonAsync.when(
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
      data: (pokemonList) {
        if (!filterState.hasActiveFilters) {
          return AsyncValue.data(pokemonList);
        }

        // Filter pokemon based on selected types
        final filteredList = pokemonList.where((pokemon) {
          final primaryType = pokemon.primaryType.toLowerCase();
          final secondaryType = pokemon.secondaryType?.toLowerCase() ?? '';

          return filterState.selectedTypes.any((selectedType) =>
              primaryType == selectedType.toLowerCase() ||
              (secondaryType.isNotEmpty && secondaryType == selectedType.toLowerCase())
          );
        }).toList();

        return AsyncValue.data(filteredList);
      },
    );
  }

  // Method to force update when filters change
  void updateFilters() {
    _updateFilteredList();
  }
}

/// Provider for the original pokemon list
final pokemonListProvider = NotifierProvider<PokemonListNotifier, AsyncValue<List<PokemonListItem>>>(PokemonListNotifier.new);

class PokemonListNotifier extends Notifier<AsyncValue<List<PokemonListItem>>> {
  @override
  AsyncValue<List<PokemonListItem>> build() {
    loadPokemon();
    return const AsyncValue.loading();
  }

  Future<void> loadPokemon() async {
    state = const AsyncValue.loading();
    try {
      final presenter = ref.read(listingPresenterProvider);
      final result = await presenter.loadData();

      state = result.match(
        onSuccess: (data) => AsyncValue.data(data),
        onFailure: (error) => AsyncValue.error(error, StackTrace.current),
      );
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

/// Notifier for managing filter state
class FilterNotifier extends Notifier<FilterState> {
  @override
  FilterState build() {
    return const FilterState();
  }

  /// Toggle a type filter
  void toggleType(String typeValue) {
    final currentTypes = Set<String>.from(state.selectedTypes);

    if (currentTypes.contains(typeValue)) {
      currentTypes.remove(typeValue);
    } else {
      currentTypes.add(typeValue);
    }

    state = state.copyWith(
      selectedTypes: currentTypes,
      isFilterApplied: currentTypes.isNotEmpty,
    );
  }

  /// Set multiple selected types
  void setSelectedTypes(Set<String> types) {
    state = state.copyWith(
      selectedTypes: types,
      isFilterApplied: types.isNotEmpty,
    );
  }

  /// Clear all filters
  void clearFilters() {
    state = const FilterState();
  }

  /// Check if a specific type is selected
  bool isTypeSelected(String typeValue) {
    return state.selectedTypes.contains(typeValue);
  }

  /// Get the count of active filters
  int get activeFilterCount => state.selectedTypes.length;
}