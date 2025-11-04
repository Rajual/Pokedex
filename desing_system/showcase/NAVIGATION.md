# Showcase Navigation System

## Descripción

El sistema de navegación del Showcase ha sido mejorado con una arquitectura centralizada y organizada que facilita la gestión de rutas y componentes.

## Arquitectura

### 📁 Estructura de Archivos

```
showcase/
├── lib/
│   ├── main.dart                    # Entry point con rutas centralizadas
│   ├── routes.dart                  # ⭐ Configuración central de rutas
│   └── screens/
│       ├── home_screen.dart         # Pantalla principal
│       ├── atoms_screen.dart        # Lista de átomos
│       ├── molecules_screen.dart    # Lista de moléculas
│       ├── organisms_screen.dart    # Lista de organismos
│       ├── templates_screen.dart    # Lista de templates
│       ├── atoms/                   # Screens de átomos individuales
│       ├── molecules/               # Screens de moléculas individuales
│       ├── organisms/               # Screens de organismos individuales
│       ├── templates/               # Screens de templates individuales
│       └── components/              # Screens de componentes compartidos
```

### 🗺️ Sistema de Rutas

El archivo `routes.dart` centraliza toda la configuración de navegación:

#### Constantes de Rutas

```dart
class ShowcaseRoutes {
  // Principales
  static const String home = '/';
  static const String atoms = '/atoms';
  static const String molecules = '/molecules';
  static const String organisms = '/organisms';
  static const String templates = '/templates';

  // Atoms
  static const String atomButton = '/atoms/button';
  static const String atomImage = '/atoms/image';
  static const String atomSvg = '/atoms/svg';
  // ... más rutas

  // Molecules
  static const String moleculeCard = '/molecules/card';
  static const String moleculeGenderBar = '/molecules/gender-bar';
  static const String moleculeSwipeableCard = '/molecules/swipeable-card';
  // ... más rutas

  // Organisms
  static const String organismFilterBottomSheet = '/organisms/filter-bottom-sheet';
  static const String organismHeroImageHeader = '/organisms/hero-image-header';
  // ... más rutas

  // Templates
  static const String templateOnboarding = '/templates/onboarding';
  static const String templatePokemonDetail = '/templates/pokemon-detail';
  // ... más rutas
}
```

#### Modelos de Datos

```dart
// Categoría de componentes
class ComponentCategory {
  final String name;                    // 'Atoms', 'Molecules', etc.
  final String description;             // Descripción de la categoría
  final IconData icon;                  // Icono representativo
  final String route;                   // Ruta principal
  final List<ComponentItem> components; // Lista de componentes
}

// Componente individual
class ComponentItem {
  final String name;        // Nombre del componente
  final String description; // Descripción breve
  final IconData icon;      // Icono
  final String route;       // Ruta directa al componente
}
```

## Uso

### Navegar a una Categoría

```dart
// Desde cualquier screen
Navigator.pushNamed(context, ShowcaseRoutes.atoms);
Navigator.pushNamed(context, ShowcaseRoutes.molecules);
```

### Navegar a un Componente Específico

```dart
// Directo al componente
Navigator.pushNamed(context, ShowcaseRoutes.atomButton);
Navigator.pushNamed(context, ShowcaseRoutes.moleculeSwipeableCard);
Navigator.pushNamed(context, ShowcaseRoutes.organismHeroImageHeader);
```

### Obtener Información de Componentes

```dart
// Obtener todas las categorías con sus componentes
final categories = ShowcaseRoutes.getComponentCategories();

// Iterar sobre categorías
for (var category in categories) {
  print('${category.name}: ${category.components.length} components');
  
  // Iterar sobre componentes de una categoría
  for (var component in category.components) {
    print('  - ${component.name}');
  }
}
```

## Agregar Nuevos Componentes

### 1. Crear la Screen del Componente

```dart
// lib/screens/atoms/new_component_screen.dart
class NewComponentScreen extends StatelessWidget {
  const NewComponentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Component')),
      body: // ... tu implementación
    );
  }
}
```

### 2. Agregar la Ruta en `routes.dart`

```dart
class ShowcaseRoutes {
  // 1. Definir la constante
  static const String atomNewComponent = '/atoms/new-component';

  // 2. Agregar al mapa de rutas
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // ... rutas existentes
      atomNewComponent: (context) => const NewComponentScreen(),
    };
  }

  // 3. Agregar a la categoría correspondiente
  static List<ComponentCategory> getComponentCategories() {
    return [
      ComponentCategory(
        name: 'Atoms',
        // ...
        components: [
          // ... componentes existentes
          ComponentItem(
            name: 'New Component',
            description: 'Description of the new component',
            icon: Icons.new_releases,
            route: atomNewComponent,
          ),
        ],
      ),
      // ... otras categorías
    ];
  }
}
```

### 3. Importar la Screen

```dart
// En routes.dart, en la sección de imports
import 'screens/atoms/new_component_screen.dart';
```

## Beneficios del Sistema

### ✅ Centralización
- Todas las rutas en un solo archivo
- Fácil de mantener y actualizar
- No hay rutas "mágicas" dispersas por el código

### ✅ Type Safety
- Constantes tipadas para todas las rutas
- Autocompletado en el IDE
- Detección de errores en compile-time

### ✅ Escalabilidad
- Agregar nuevos componentes es trivial
- La estructura se mantiene organizada
- Fácil de refactorizar

### ✅ Metadatos Ricos
- Cada componente tiene nombre, descripción e icono
- Genera automáticamente listas de componentes
- UI consistente en todas las pantallas de categoría

### ✅ Navegación Jerárquica Clara
```
/                          (Home)
├── /atoms                 (Lista de Atoms)
│   ├── /atoms/button
│   ├── /atoms/image
│   └── ...
├── /molecules             (Lista de Molecules)
│   ├── /molecules/card
│   ├── /molecules/swipeable-card
│   └── ...
├── /organisms             (Lista de Organisms)
│   └── ...
└── /templates             (Lista de Templates)
    └── ...
```

## Convenciones

### Nombres de Rutas
- Usar kebab-case: `/atoms/dot-indicator`
- Prefijos por categoría: `/atoms/`, `/molecules/`, etc.
- Descriptivos y concisos

### Nombres de Archivos
- snake_case: `swipeable_card_showcase_screen.dart`
- Sufijo `_screen.dart` para pantallas

### Organización de Carpetas
- Agrupar por categoría en `screens/`
- Componentes compartidos en `components/`
- Un archivo por screen

## Ejemplos de Navegación

### Breadcrumb Navigation
```dart
// Home → Molecules → Swipeable Card
Navigator.pushNamed(context, ShowcaseRoutes.home);
Navigator.pushNamed(context, ShowcaseRoutes.molecules);
Navigator.pushNamed(context, ShowcaseRoutes.moleculeSwipeableCard);
```

### Direct Access
```dart
// Saltar directo a un componente
Navigator.pushNamed(context, ShowcaseRoutes.organismHeroImageHeader);
```

### Pop to Category
```dart
// Volver a la categoría padre
Navigator.popUntil(context, ModalRoute.withName(ShowcaseRoutes.molecules));
```

## Testing

```dart
// Verificar que todas las rutas están definidas
test('All routes are defined', () {
  final routes = ShowcaseRoutes.getRoutes();
  expect(routes.containsKey(ShowcaseRoutes.atomButton), true);
  expect(routes.containsKey(ShowcaseRoutes.moleculeCard), true);
});

// Verificar categorías
test('All categories have components', () {
  final categories = ShowcaseRoutes.getComponentCategories();
  for (var category in categories) {
    expect(category.components.isNotEmpty, true);
  }
});
```

## Resumen

El nuevo sistema de navegación proporciona:
1. **Rutas centralizadas** en un solo archivo
2. **Type-safe navigation** con constantes
3. **Metadata rica** para cada componente
4. **Organización clara** por categorías
5. **Escalabilidad** fácil para nuevos componentes
6. **UI consistente** en todas las pantallas

¡Ahora es mucho más fácil navegar y mantener el Showcase! 🚀
