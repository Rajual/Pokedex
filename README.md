# Pokédex Flutter App

Una aplicación completa de Pokédex construida con Flutter, que presenta una arquitectura moderna, un sistema de diseño personalizado y una cobertura exhaustiva de pruebas.

## 📋 Descripción General

Esta aplicación Pokédex demuestra las mejores prácticas de desarrollo Flutter incluyendo Arquitectura Limpia, gestión de estado con Riverpod, pruebas exhaustivas y un sistema de diseño personalizado. La aplicación proporciona información detallada sobre Pokémon con características como listado, búsqueda, filtrado, favoritos y vistas detalladas.

### Enfoque de Desarrollo
El proyecto se desarrolló con un enfoque moderno donde la IA se utilizó para el trabajo duro de codificación, permitiendo que el desarrollador se enfocara principalmente en la arquitectura, diseño de sistemas y toma de decisiones estratégicas. Esto resultó en un código de alta calidad con una arquitectura sólida y mantenible.

## 🏗️ Arquitectura

### Patrón MVP (Model-View-Presenter)

La aplicación implementa el patrón **MVP (Model-View-Presenter)** combinado con **Arquitectura Limpia**, proporcionando una separación clara de responsabilidades:

```
lib/
├── app/                    # Capa de aplicación
│   ├── config/            # Configuración (localizaciones, temas)
│   ├── providers/         # Proveedores Riverpod
│   └── routes/            # Navegación y rutas
├── core/                  # Lógica de negocio central
│   ├── common/            # Utilidades compartidas (Result, Preferences)
│   ├── constants/         # Constantes de la aplicación
│   └── data/              # Capa de datos (gateways, modelos)
└── features/              # Módulos basados en características
    ├── details/           # Característica de detalles de Pokémon
    ├── error/             # Característica de manejo de errores
    ├── favorites/         # Característica de gestión de favoritos
    ├── home/              # Característica de navegación principal
    ├── listing/           # Característica de listado de Pokémon
    ├── onboarding/        # Característica de incorporación de usuarios
    └── splash/            # Característica de pantalla de inicio
```

### Arquitectura Limpia por Característica

Cada característica sigue el patrón MVP con tres capas claras:

```
features/[característica]/
├── domain/                 # Lógica de negocio
│   ├── entities/          # Entidades del dominio
│   ├── repositories/      # Repositorios abstractos
│   └── usecases/          # Casos de uso de aplicación
├── data/                  # Acceso a datos
│   ├── repositories/      # Implementaciones concretas de repositorios
│   └── sources/           # Fuentes de datos (API, almacenamiento local)
└── presentation/          # Presentación
    ├── presenter/         # Gestión de estado (presentadores Riverpod)
    └── view/              # Widgets de UI
```

## 🎯 Características Principales

### 1. Incorporación de Usuarios (Onboarding)
Flujo de incorporación de usuarios con múltiples pantallas que guía a los nuevos usuarios a través de las características principales de la aplicación. Después de completar el onboarding por primera vez, se muestra un diálogo preguntando si el usuario desea volver a recorrerlo.

### 2. Listado de Pokémon
Pantalla principal que muestra un listado paginado de Pokémon con funcionalidades de búsqueda por nombre/ID y filtrado por tipos de Pokémon.

### 3. Detalles de Pokémon
Vista detallada de cada Pokémon que incluye estadísticas, tipos, habilidades, altura, peso y otras características específicas.

### 4. Favoritos
Sistema de gestión de Pokémon favoritos que permite marcar/desmarcar Pokémon como favoritos y visualizarlos en una lista dedicada.

### 5. Inicio (Home)
Navegación principal con pestañas inferiores que permite alternar entre la lista de Pokémon y los favoritos guardados.

### 6. Manejo de Errores
Sistema completo de manejo de errores que proporciona mensajes contextuales y opciones de recuperación para diferentes tipos de fallos.



## 📱 Estructura del Proyecto

```
lib/
├── app/                    # Capa de aplicación
│   ├── config/            # Configuración (localizaciones, temas)
│   ├── providers/         # Proveedores Riverpod
│   └── routes/            # Navegación y rutas
├── core/                  # Lógica de negocio central
│   ├── common/            # Utilidades compartidas (Result, Preferences)
│   ├── constants/         # Constantes de la aplicación
│   └── data/              # Capa de datos (gateways, modelos)
└── features/              # Módulos basados en características
    ├── details/           # Característica de detalles de Pokémon
    ├── error/             # Característica de manejo de errores
    ├── favorites/         # Característica de gestión de favoritos
    ├── home/              # Característica de navegación principal
    ├── listing/           # Característica de listado de Pokémon
    ├── onboarding/        # Característica de incorporación de usuarios
    └── splash/            # Característica de pantalla de inicio
```




## 🚀 Inicio Rápido

### Prerrequisitos
- Flutter SDK (versión 3.0 o superior)
- Dart SDK (incluido con Flutter)
- Un editor de código (VS Code recomendado con extensiones Flutter)

### Instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/tu-usuario/pokedex-flutter.git
cd pokedex-flutter
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Generar archivos de código**
```bash
flutter pub run build_runner build
```

4. **Ejecutar la aplicación**
```bash
flutter run
```

### Ejecutar Pruebas

```bash
# Ejecutar todas las pruebas
flutter test

# Ejecutar pruebas con cobertura
flutter test --coverage

# Ejecutar pruebas específicas
flutter test test/features/listing/domain/usecases/
```

### Construir para Producción

```bash
# Construir para Android
flutter build apk --release

# Construir para iOS
flutter build ios --release

# Construir para Web
flutter build web --release
```

## 🧪 Estrategia de Pruebas

### Cobertura Implementada
- **Pruebas unitarias**: Lógica de negocio, entidades, repositorios y casos de uso
- **Pruebas de widgets**: Componentes de UI, pantallas y navegación

### Metas de Cobertura
- **Mínimo 80%** de cobertura de línea en todas las capas
- **Caminos críticos**: Todos los recorridos de usuario probados
- **Casos extremos**: Estados de error, estados vacíos, estados de carga



# 🚀 Mejoras Futuras

- **Accesibilidad**: Implementar mejores prácticas de accesibilidad para usuarios con discapacidades ([Ver taller de accesibilidad](https://github.com/Rajual/taller_accesibilidad) - [En este tutorial implementamos accesibilidad](https://www.youtube.com/watch?v=nkktJanJWDM))
- **Modularización**: Crear packages separados para cada feature y el sistema de diseño para mejorar la reutilización y mantenibilidad
- **UI/UX**: Afinar la interfaz de usuario con mejoras en animaciones, microinteracciones y experiencia visual

---

*Desarrollado con ❤️ usando Flutter y siguiendo las mejores prácticas de desarrollo móvil.*


## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo [LICENSE](LICENSE) para más detalles.