# Swipeable Card Feature

## Descripción

La funcionalidad **Swipeable Card** permite agregar acciones deslizables a las `AppCard`. Los usuarios pueden deslizar las cards a la izquierda para revelar y ejecutar acciones como eliminar, archivar, marcar como favorito, compartir o acciones personalizadas.

## Características

✅ **Múltiples tipos de acciones predefinidas**:
- Delete (Eliminar)
- Archive (Archivar)
- Favorite (Favorito)
- Share (Compartir)
- Custom (Personalizada)

✅ **Configuración flexible**:
- Color de fondo personalizable
- Icono y color de icono
- Etiqueta opcional
- Umbral de activación ajustable (threshold)
- Animaciones suaves

✅ **Fácil integración**: Solo agrega el parámetro `swipeAction` a cualquier `AppCard`

## Uso Básico

### 1. Card con acción de eliminar

```dart
AppCard(
  uiModel: AppCardUiModel(
    pokemonName: 'Bulbasaur',
    pokemonNumber: 1,
    primaryType: PokemonType.grass,
    imagePath: 'assets/ilustration/PokemonBulbasaur.png',
    backgroundColor: Color(0xFF78C850),
    isFavorite: false,
  ),
  onFavoriteChanged: (value) {
    setState(() => isFavorite = value);
  },
  swipeAction: SwipeActionUiModel.delete(
    label: 'Eliminar',
    onAction: () {
      // Ejecutar lógica de eliminación
      print('Pokemon eliminado');
    },
  ),
)
```

### 2. Card con acción de archivar

```dart
AppCard(
  uiModel: AppCardUiModel(
    pokemonName: 'Charmander',
    pokemonNumber: 4,
    primaryType: PokemonType.fire,
    imagePath: 'assets/ilustration/PokemonCharmander.png',
    backgroundColor: Color(0xFFF08030),
    isFavorite: true,
  ),
  onFavoriteChanged: (value) {},
  swipeAction: SwipeActionUiModel.archive(
    label: 'Archivar',
    backgroundColor: Color(0xFF6C757D),
    onAction: () {
      print('Pokemon archivado');
    },
  ),
)
```

### 3. Card con acción personalizada

```dart
AppCard(
  uiModel: AppCardUiModel(
    pokemonName: 'Squirtle',
    pokemonNumber: 7,
    primaryType: PokemonType.water,
    imagePath: 'assets/ilustration/PokemonSquirtle.png',
    backgroundColor: Color(0xFF6890F0),
    isFavorite: false,
  ),
  onFavoriteChanged: (value) {},
  swipeAction: SwipeActionUiModel.custom(
    backgroundColor: Color(0xFF9C27B0),
    icon: Icons.info_outline,
    iconColor: Colors.white,
    label: 'Info',
    threshold: 0.5, // Requiere deslizar 50% del ancho
    onAction: () {
      print('Mostrar información detallada');
    },
  ),
)
```

## Configuración Avanzada

### SwipeActionUiModel

| Parámetro | Tipo | Descripción | Por defecto |
|-----------|------|-------------|-------------|
| `type` | `SwipeActionType` | Tipo de acción (delete, archive, favorite, share, custom) | - |
| `backgroundColor` | `Color` | Color de fondo cuando se desliza | Depende del tipo |
| `icon` | `IconData` | Icono de la acción | Depende del tipo |
| `iconColor` | `Color` | Color del icono | `Colors.white` |
| `label` | `String?` | Texto opcional debajo del icono | `null` |
| `onAction` | `VoidCallback?` | Callback cuando se completa la acción | `null` |
| `threshold` | `double` | Distancia mínima para activar (0.0 - 1.0) | `0.4` (40%) |

### Threshold (Umbral)

El `threshold` determina qué porcentaje del ancho de la card debe deslizarse para activar la acción:

- `0.3` = 30% del ancho (más fácil de activar)
- `0.4` = 40% del ancho (por defecto)
- `0.5` = 50% del ancho (requiere más deslizamiento)

## Comportamiento

1. **Deslizar a la izquierda**: Revela el fondo con el icono y la acción
2. **Superar el threshold**: La card se completa la animación y ejecuta la acción
3. **No alcanzar threshold**: La card vuelve a su posición original
4. **Después de la acción**: La card se resetea automáticamente después de 300ms

## Ejemplo Completo: Lista con Acciones

```dart
class PokemonListScreen extends StatefulWidget {
  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<Pokemon> pokemons = [...];

  void _deletePokemon(String id) {
    setState(() {
      pokemons.removeWhere((p) => p.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pokemon eliminado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return AppCard(
            uiModel: AppCardUiModel(
              pokemonName: pokemon.name,
              pokemonNumber: pokemon.number,
              primaryType: pokemon.primaryType,
              imagePath: pokemon.imagePath,
              backgroundColor: pokemon.color,
              isFavorite: pokemon.isFavorite,
            ),
            onFavoriteChanged: (value) {
              setState(() => pokemon.isFavorite = value);
            },
            onTap: () => _navigateToDetail(pokemon),
            swipeAction: SwipeActionUiModel.delete(
              label: 'Eliminar',
              onAction: () => _deletePokemon(pokemon.id),
            ),
          );
        },
      ),
    );
  }
}
```

## Testing

La funcionalidad incluye tests completos:

```bash
flutter test test/molecules/swipeable_card_test.dart
```

**Cobertura de tests:**
- ✅ Renderizado del SwipeableCard
- ✅ Card sin acción (fallback normal)
- ✅ Animación de swipe
- ✅ Activación de acción al superar threshold
- ✅ Card deshabilitada no responde
- ✅ Modelos de SwipeAction (delete, archive, favorite, custom)
- ✅ Validación de threshold
- ✅ Integración con AppCard

## Showcase

Ejecuta el showcase screen para ver ejemplos interactivos:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SwipeableCardShowcaseScreen(),
  ),
);
```

## Arquitectura

```
lib/molecules/app_card/
├── app_card.dart                          # Widget principal con swipe
├── swipeable_card.dart                    # Widget de swipe genérico
├── models/
│   ├── app_card_ui_model.dart            # Modelo de la card
│   └── swipe_action_ui_model.dart        # Modelo de acciones
└── exports.dart                           # Exports públicos

test/molecules/
└── swipeable_card_test.dart              # Tests completos
```

## Notas

- El swipe solo funciona horizontalmente hacia la izquierda
- La card mantiene toda su funcionalidad normal (tap, favorite)
- Las animaciones son suaves y responden al gesto del usuario
- Completamente integrado con el design system existente
