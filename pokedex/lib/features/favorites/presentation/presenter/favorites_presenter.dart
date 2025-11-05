import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/result.dart';
import '../../domain/entities/favorites_entity.dart';
import '../../domain/repositories/favorites_repository.dart';
import '../../domain/usecases/load_favorites_usecase.dart';
import '../../data/repositories/favorites_repository_impl.dart';

/// State for the favorites - includes IDs of favorite Pokemon
class FavoritesState {
  final Set<String> favoriteIds;
  final bool isLoading;
  final String? error;

  const FavoritesState({
    this.favoriteIds = const {},
    this.isLoading = false,
    this.error,
  });

  FavoritesState copyWith({
    Set<String>? favoriteIds,
    bool? isLoading,
    String? error,
  }) {
    return FavoritesState(
      favoriteIds: favoriteIds ?? this.favoriteIds,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  bool isFavorite(String pokemonId) {
    return favoriteIds.contains(pokemonId);
  }
}

/// Notifier for managing favorites state reactively
class FavoritesNotifier extends Notifier<FavoritesState> {
  @override
  FavoritesState build() {
    // Load favorites asynchronously after build completes
    Future.microtask(() => loadFavorites());
    return const FavoritesState();
  }

  /// Loads all favorites and updates state
  Future<void> loadFavorites() async {
    state = state.copyWith(isLoading: true, error: null);
    
    final repository = ref.read(favoritesRepositoryProvider);
    final result = await repository.loadFavorites();
    
    result.match(
      onSuccess: (data) {
        final ids = data.favorites.map((f) => f.id).toSet();
        state = state.copyWith(
          favoriteIds: ids,
          isLoading: false,
        );
      },
      onFailure: (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.toString(),
        );
      },
    );
  }

  /// Adds a Pokemon to favorites
  Future<bool> addToFavorites(FavoritePokemon pokemon) async {
    final repository = ref.read(favoritesRepositoryProvider);
    final result = await repository.addToFavorites(pokemon);
    
    return result.match(
      onSuccess: (success) {
        if (success) {
          // Update state immediately
          final newIds = Set<String>.from(state.favoriteIds)..add(pokemon.id);
          state = state.copyWith(favoriteIds: newIds);
        }
        return success;
      },
      onFailure: (_) => false,
    );
  }

  /// Removes a Pokemon from favorites
  Future<bool> removeFromFavorites(String pokemonId) async {
    final repository = ref.read(favoritesRepositoryProvider);
    final result = await repository.removeFromFavorites(pokemonId);
    
    return result.match(
      onSuccess: (success) {
        if (success) {
          // Update state immediately
          final newIds = Set<String>.from(state.favoriteIds)..remove(pokemonId);
          state = state.copyWith(favoriteIds: newIds);
        }
        return success;
      },
      onFailure: (_) => false,
    );
  }

  /// Toggles favorite status
  Future<bool> toggleFavorite(String pokemonId, FavoritePokemon? pokemon) async {
    if (state.isFavorite(pokemonId)) {
      return await removeFromFavorites(pokemonId);
    } else {
      if (pokemon == null) return false;
      return await addToFavorites(pokemon);
    }
  }

  /// Checks if a Pokemon is favorite
  bool isFavorite(String pokemonId) {
    return state.isFavorite(pokemonId);
  }
}

/// Provider for the favorites notifier (reactive state)
final favoritesNotifierProvider = NotifierProvider<FavoritesNotifier, FavoritesState>(() {
  return FavoritesNotifier();
});

/// Presenter for favorites feature using Riverpod (legacy support)
class FavoritesPresenter {
  final LoadFavoritesUseCase _loadFavoritesUseCase;

  FavoritesPresenter(this._loadFavoritesUseCase);

  /// Loads favorites data
  Future<Result<FavoritesData, FavoritesFailure>> loadFavorites() async {
    return await _loadFavoritesUseCase();
  }

  /// Removes a Pokemon from favorites
  Future<Result<bool, FavoritesFailure>> removeFromFavorites(String pokemonId) async {
    final repository = FavoritesRepositoryImpl();
    return await repository.removeFromFavorites(pokemonId);
  }

  /// Adds a Pokemon to favorites
  Future<Result<bool, FavoritesFailure>> addToFavorites(FavoritePokemon pokemon) async {
    final repository = FavoritesRepositoryImpl();
    return await repository.addToFavorites(pokemon);
  }

  /// Checks if a Pokemon is in favorites
  Future<Result<bool, FavoritesFailure>> isFavorite(String pokemonId) async {
    final repository = FavoritesRepositoryImpl();
    return await repository.isFavorite(pokemonId);
  }
}

/// Provider for the favorites presenter
final favoritesPresenterProvider = Provider<FavoritesPresenter>((ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  final loadFavoritesUseCase = LoadFavoritesUseCase(repository);
  return FavoritesPresenter(loadFavoritesUseCase);
});

/// Provider for the favorites repository
final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepositoryImpl();
});