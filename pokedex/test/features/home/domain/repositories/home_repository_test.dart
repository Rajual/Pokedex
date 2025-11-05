import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../../lib/core/common/result.dart';
import '../../../../../lib/features/home/domain/entities/home_entity.dart';
import '../../../../../lib/features/home/domain/repositories/home_repository.dart';

// Create a mock class for HomeRepository
class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
  });

  group('HomeRepository', () {
    test('loadHomeData should return HomeData on success', () async {
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
      final result = await mockRepository.loadHomeData();

      // Assert
      expect(result.isSuccess, true);
      expect(result.match(onSuccess: (data) => data, onFailure: (_) => null), expectedData);
    });

    test('loadHomeData should return HomeFailure on error', () async {
      // Arrange
      when(mockRepository.loadHomeData())
          .thenAnswer((_) async => Result.failure(HomeFailure.localizationError('Test error')));

      // Act
      final result = await mockRepository.loadHomeData();

      // Assert
      expect(result.isFailure, true);
      result.match(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) => expect(failure.toString(), contains('Test error')),
      );
    });

    test('loadHomeConfig should return HomeConfig on success', () async {
      // Arrange
      final expectedConfig = HomeConfig(
        initialSelectedIndex: 1,
        keepPagesAlive: false,
      );
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.success(expectedConfig));

      // Act
      final result = await mockRepository.loadHomeConfig();

      // Assert
      expect(result.isSuccess, true);
      expect(result.match(onSuccess: (config) => config, onFailure: (_) => null), expectedConfig);
    });

    test('loadHomeConfig should return HomeFailure on error', () async {
      // Arrange
      when(mockRepository.loadHomeConfig())
          .thenAnswer((_) async => Result.failure(HomeFailure.parsingError('Parse error')));

      // Act
      final result = await mockRepository.loadHomeConfig();

      // Assert
      expect(result.isFailure, true);
      result.match(
        onSuccess: (_) => fail('Expected failure'),
        onFailure: (failure) => expect(failure.toString(), contains('Parse error')),
      );
    });
  });
}