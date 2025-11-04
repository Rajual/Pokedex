# OnboardingTemplate

Template reutilizable para pantallas de onboarding/walkthrough con navegación horizontal y seguimiento de progreso.

## Características

### ✅ Componentes Reutilizados
- **AppImage**: Para mostrar ilustraciones
- **AppButton**: Para botones de navegación (Continuar/Empezar)
- **DotIndicator**: Para mostrar progreso y página actual
- **TextTheme**: Para títulos y descripciones

### ✅ Funcionalidades

1. **PageView con scroll horizontal**
   - Navegación fluida entre páginas
   - Animaciones suaves de 300ms

2. **DotIndicator configurable**
   - Variantes: dots (circular) o bars (horizontal)
   - Tamaños: small, medium, large
   - Tap para navegar directamente a una página

3. **Botones de navegación**
   - Botón "Saltar" (configurable, se oculta en última página)
   - Botón "Continuar" (cambia a texto personalizado en última página)
   - Textos personalizables

4. **Personalización por página**
   - Imagen independiente
   - Título y descripción
   - Color de fondo opcional
   - Color de texto opcional

## Uso

### Ejemplo básico

\`\`\`dart
OnboardingTemplate(
  pages: const [
    OnboardingPageModel(
      imagePath: 'assets/ilustration/PokemonCharizard.png',
      title: 'Todos los Pokémon en\nun solo lugar',
      description: 'Accede a una amplia lista de Pokémon...',
    ),
    OnboardingPageModel(
      imagePath: 'assets/ilustration/PokemonMewtwo.png',
      title: 'Mantén tu Pokédex\nactualizada',
      description: 'Registra y guarda tu perfil...',
    ),
  ],
  onFinish: () {
    Navigator.pushReplacement(...);
  },
)
\`\`\`

### Ejemplo con personalización completa

\`\`\`dart
OnboardingTemplate(
  pages: const [
    OnboardingPageModel(
      imagePath: 'assets/page1.png',
      title: 'Bienvenido',
      description: 'Comienza tu aventura',
      backgroundColor: AppColors.primary,
      textColor: AppColors.white,
    ),
    OnboardingPageModel(
      imagePath: 'assets/page2.png',
      title: 'Explora',
      description: 'Descubre nuevas funciones',
    ),
  ],
  onFinish: () => print('Completado'),
  onSkip: () => print('Saltado'),
  continueButtonText: 'Siguiente',
  skipButtonText: 'Omitir',
  finishButtonText: '¡Comenzar!',
  indicatorVariant: DotIndicatorVariant.bars,
  indicatorSize: DotIndicatorSize.large,
  showSkipButton: true,
  horizontalPadding: 32.0,
)
\`\`\`

## API

### OnboardingTemplate

| Propiedad | Tipo | Default | Descripción |
|-----------|------|---------|-------------|
| `pages` | `List<OnboardingPageModel>` | required | Lista de páginas del onboarding |
| `onFinish` | `VoidCallback` | required | Callback al completar el onboarding |
| `onSkip` | `VoidCallback?` | null | Callback al saltar (si null, llama a onFinish) |
| `continueButtonText` | `String` | "Continuar" | Texto del botón de continuar |
| `skipButtonText` | `String` | "Saltar" | Texto del botón de saltar |
| `finishButtonText` | `String` | "Empezamos" | Texto del botón final |
| `indicatorSize` | `DotIndicatorSize` | medium | Tamaño del indicador |
| `indicatorVariant` | `DotIndicatorVariant` | dots | Variante del indicador |
| `showSkipButton` | `bool` | true | Si se muestra el botón saltar |
| `horizontalPadding` | `double` | 24.0 | Padding horizontal del contenido |

### OnboardingPageModel

| Propiedad | Tipo | Default | Descripción |
|-----------|------|---------|-------------|
| `imagePath` | `String` | required | Ruta del asset de la imagen |
| `title` | `String` | required | Título de la página |
| `description` | `String` | required | Descripción de la página |
| `backgroundColor` | `Color?` | null | Color de fondo opcional |
| `textColor` | `Color?` | null | Color del texto opcional |

## Tests

El template incluye 17 tests que cubren:

- ✅ Renderizado correcto de páginas
- ✅ Botón de saltar (mostrar/ocultar)
- ✅ Cambio de botón en última página
- ✅ Callbacks de onFinish y onSkip
- ✅ Navegación entre páginas
- ✅ Variantes del DotIndicator
- ✅ Tap en indicadores para navegar
- ✅ Contenido de páginas
- ✅ Personalización de textos
- ✅ Padding personalizado
- ✅ Validaciones (assertions)

## Showcase

La aplicación showcase incluye 4 ejemplos diferentes:

1. **Pokemon Welcome**: Onboarding inspirado en las imágenes del diseño (2 páginas)
2. **Features Showcase**: 3 páginas mostrando diferentes features
3. **Variant Bars**: Ejemplo con indicador tipo barras
4. **Sin botón Skip**: Onboarding obligatorio sin opción de saltar

## Arquitectura

```
OnboardingTemplate (StatefulWidget)
├── SafeArea
│   └── Column
│       ├── Header (botón Skip) - Condicional
│       ├── PageView (páginas)
│       │   └── _OnboardingPage × N
│       │       ├── AppImage
│       │       ├── Text (título)
│       │       └── Text (descripción)
│       ├── DotIndicator
│       └── AppButton (Continuar/Empezar)
```

## Casos de uso

- ✅ Onboarding de aplicación (primera vez)
- ✅ Tutoriales de features nuevas
- ✅ Walkthroughs guiados
- ✅ Presentaciones de productos
- ✅ Galerías con navegación
- ✅ Instrucciones paso a paso

## Notas de implementación

- El template usa `PageController` para manejar la navegación
- Las animaciones son suaves con curva `easeInOut` de 300ms
- El botón "Saltar" se oculta automáticamente en la última página
- Los tap en los dots del indicador permiten navegación directa
- El template es completamente responsive y se adapta al tamaño de pantalla
