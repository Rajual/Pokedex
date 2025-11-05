import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../../lib/core/common/result.dart';
import '../../../../../lib/features/home/domain/entities/home_entity.dart';
import '../../../../../lib/features/home/domain/repositories/home_repository.dart';
import '../../../../../lib/features/home/domain/usecases/load_home_data_usecase.dart';

// Create a mock class for HomeRepository
class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository mockRepository;
  late LoadHomeDataUseCase loadHomeDataUseCase;
  late LoadHomeConfigUseCase loadHomeConfigUseCase;
  late LoadHomeSetupUseCase loadHomeSetupUseCase;

  setUp(() {
    mockRepository = MockHomeRepository();
    loadHomeDataUseCase = LoadHomeDataUseCase(mockRepository);
    loadHomeConfigUseCase = LoadHomeConfigUseCase(mockRepository);
    loadHomeSetupUseCase = LoadHomeSetupUseCase(
      loadHomeDataUseCase,
      loadHomeConfigUseCase,
    );
  });

  group('LoadHomeDataUseCase', () {
    test('should return HomeData on success', () async {
      // Arrange
      final expectedData = HomeData(
        title: 'Test App',
        welcomeMessage: 'Welcome!',
        navigationItems: [],
        pageRoutes: [],
      );
      when(mockRepository.loadHomeData())
          .thenAnswer((_) async => Result.success(expectedData));

      // Act
      final result = await loadHomeDataUseCase();

      // Assert
      expect(result.isSuccess, true);
      expect(result.match(onSuccess: (data) => data, onFailure: (_) => null), expectedData);
    });

    test('should return HomeFailure on repository error', () async {
      // Arrange
      when(mockRepository.loadHomeData())
          .thenAnswer((_) async => Result.failure(HomeFailure.localizationError('Test error')));

      // Act
      final result = await loadHomeDataUseCase();

      // Assert
      expect(result.isFailure, true);
      result.match(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) => expect(failure.toString(), contains('Test error')),
      );
    });
  });

  group('LoadHomeConfigUseCase', () {
    test('should return HomeConfig on success', () async {
      // Arrange
      final expectedConfig = HomeConfig(
        initialSelectedIndex: 1,
        keepPagesAlive: false,
      );
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.success(expectedConfig));

      // Act
      final result = await loadHomeConfigUseCase();

      // Assert
      expect(result.isSuccess, true);
      expect(result.match(onSuccess: (config) => config, onFailure: (_) => null), expectedConfig);
    });

    test('should return HomeFailure on repository error', () async {
      // Arrange
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.failure(HomeFailure.parsingError('Parse error')));

      // Act
      final result = await loadHomeConfigUseCase();

      // Assert
      expect(result.isFailure, true);
      result.match(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) => expect(failure.toString(), contains('Parse error')),
      );
    });
  });

  group('LoadHomeSetupUseCase', () {
    test('should return both HomeData and HomeConfig on success', () async {
      // Arrange
      final expectedData = HomeData(
        title: 'Test App',
        welcomeMessage: 'Welcome!',
        navigationItems: [],
        pageRoutes: [],
      );
      final expectedConfig = HomeConfig(
        initialSelectedIndex: 1,
        keepPagesAlive: false,
      );

      when(mockRepository.loadHomeData())
          .thenAnswer((_) async => Result.success(expectedData));
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.success(expectedConfig));

      // Act
      final result = await loadHomeSetupUseCase();

      // Assert
      expect(result.isSuccess, true);
      result.match(
        onSuccess: (setup) {
          expect(setup.$1, expectedData);
          expect(setup.$2, expectedConfig);
        },
        onFailure: (_) => fail('Expected success'),
      );
    });

    test('should return HomeFailure when data loading fails', () async {
      // Arrange
      when(mockRepository.loadHomeData())
          .thenAnswer((_) async => Result.failure(HomeFailure.localizationError('Data error')));
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.success(HomeConfig()));

      // Act
      final result = await loadHomeSetupUseCase();

      // Assert
      expect(result.isFailure, true);
      result.match(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) => expect(failure.toString(), contains('Data error')),
      );
    });

    test('should return HomeFailure when config loading fails', () async {
      // Arrange
      when(mockRepository.loadHomeData())
          .thenAnswer((_) async => Result.success(HomeData(
            title: 'Test',
            welcomeMessage: 'Welcome',
            navigationItems: [],
            pageRoutes: [],
          )));
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.failure(HomeFailure.parsingError('Config error')));

      // Act
      final result = await loadHomeSetupUseCase();

      // Assert
      expect(result.isFailure, true);
      result.match(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) => expect(failure.toString(), contains('Config error')),
      );
    });
  });
}