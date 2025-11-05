import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../../lib/core/common/result.dart';
import '../../../../../lib/features/home/domain/entities/home_entity.dart';
import '../../../../../lib/features/home/domain/repositories/home_repository.dart';
import '../../../../../lib/features/home/domain/usecases/load_home_data_usecase.dart';
import '../../../../../lib/features/home/presentation/presenter/home_presenter.dart';

// Create a mock class for HomeRepository
class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository mockRepository;
  late LoadHomeDataUseCase loadHomeDataUseCase;
  late LoadHomeConfigUseCase loadHomeConfigUseCase;
  late LoadHomeSetupUseCase loadHomeSetupUseCase;
  late HomePresenter presenter;

  setUp(() {
    mockRepository = MockHomeRepository();
    loadHomeDataUseCase = LoadHomeDataUseCase(mockRepository);
    loadHomeConfigUseCase = LoadHomeConfigUseCase(mockRepository);
    loadHomeSetupUseCase = LoadHomeSetupUseCase(
      loadHomeDataUseCase,
      loadHomeConfigUseCase,
    );
    presenter = HomePresenter(loadHomeSetupUseCase);
  });

  group('HomePresenter', () {
    test('loadHomeSetup should return both HomeData and HomeConfig on success', () async {
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
      final result = await presenter.loadHomeSetup();

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

    test('loadHomeSetup should return HomeFailure when data loading fails', () async {
      // Arrange
      when(mockRepository.loadHomeData())
          .thenAnswer((_) async => Result.failure(HomeFailure.localizationError('Data error')));
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.success(HomeConfig()));

      // Act
      final result = await presenter.loadHomeSetup();

      // Assert
      expect(result.isFailure, true);
      result.match(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) => expect(failure.toString(), contains('Data error')),
      );
    });

    test('loadHomeSetup should return HomeFailure when config loading fails', () async {
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
      final result = await presenter.loadHomeSetup();

      // Assert
      expect(result.isFailure, true);
      result.match(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) => expect(failure.toString(), contains('Config error')),
      );
    });

    test('loadHomeData should delegate to use case', () async {
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
      final result = await presenter.loadHomeData();

      // Assert
      expect(result.isSuccess, true);
      expect(result.match(onSuccess: (data) => data, onFailure: (_) => null), expectedData);
    });

    test('loadHomeConfig should delegate to use case', () async {
      // Arrange
      final expectedConfig = HomeConfig(
        initialSelectedIndex: 1,
        keepPagesAlive: false,
      );
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.success(expectedConfig));

      // Act
      final result = await presenter.loadHomeConfig();

      // Assert
      expect(result.isSuccess, true);
      expect(result.match(onSuccess: (config) => config, onFailure: (_) => null), expectedConfig);
    });
  });
}