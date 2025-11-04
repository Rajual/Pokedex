import 'package:flutter/material.dart';

// Atoms
import 'screens/components/button_detail_screen.dart';
import 'screens/components/image_detail_screen.dart';
import 'screens/components/svg_detail_screen.dart';
import 'screens/components/favorite_tag_detail_screen.dart';
import 'screens/atoms/dot_indicator_screen.dart';
import 'screens/atoms/stat_card_screen.dart';

// Molecules
import 'screens/molecules/gender_bar_screen.dart';
import 'screens/components/card_detail_screen.dart';
import 'screens/components/type_tag_detail_screen.dart';
import 'screens/components/search_bar_detail_screen.dart';
import 'screens/molecules/swipeable_card_showcase_screen.dart';
import 'screens/molecules/bottom_navigation_bar_showcase_screen.dart';

// Organisms
import 'screens/organisms/filter_bottom_sheet_screen.dart';
import 'screens/organisms/hero_image_header_screen.dart';

// Templates
import 'screens/templates/onboarding_template_screen.dart';
import 'screens/templates/empty_state_template_screen.dart';
import 'screens/templates/pokemon_detail_template_screen.dart';
import 'screens/templates/home_template_screen.dart';

// Main screens
import 'screens/home_screen.dart';
import 'screens/atoms_screen.dart';
import 'screens/molecules_screen.dart';
import 'screens/organisms_screen.dart';
import 'screens/templates_screen.dart';

/// Configuración centralizada de rutas para el Showcase
class ShowcaseRoutes {
  // Rutas principales
  static const String home = '/';
  static const String atoms = '/atoms';
  static const String molecules = '/molecules';
  static const String organisms = '/organisms';
  static const String templates = '/templates';

  // Rutas de Atoms
  static const String atomButton = '/atoms/button';
  static const String atomImage = '/atoms/image';
  static const String atomSvg = '/atoms/svg';
  static const String atomFavoriteTag = '/atoms/favorite-tag';
  static const String atomDotIndicator = '/atoms/dot-indicator';
  static const String atomStatCard = '/atoms/stat-card';

  // Rutas de Molecules
  static const String moleculeCard = '/molecules/card';
  static const String moleculeTypeTag = '/molecules/type-tag';
  static const String moleculeSearchBar = '/molecules/search-bar';
  static const String moleculeGenderBar = '/molecules/gender-bar';
  static const String moleculeSwipeableCard = '/molecules/swipeable-card';
  static const String moleculeBottomNavigationBar = '/molecules/bottom-navigation-bar';

  // Rutas de Organisms
  static const String organismFilterBottomSheet = '/organisms/filter-bottom-sheet';
  static const String organismHeroImageHeader = '/organisms/hero-image-header';

  // Rutas de Templates
  static const String templateOnboarding = '/templates/onboarding';
  static const String templateEmptyState = '/templates/empty-state';
  static const String templatePokemonDetail = '/templates/pokemon-detail';
  static const String templateHome = '/templates/home';

  /// Genera todas las rutas de la aplicación
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // Principales
      home: (context) => const HomeScreen(),
      atoms: (context) => const AtomsScreen(),
      molecules: (context) => const MoleculesScreen(),
      organisms: (context) => const OrganismsScreen(),
      templates: (context) => const TemplatesScreen(),

      // Atoms
      atomButton: (context) => const ButtonDetailScreen(),
      atomImage: (context) => const ImageDetailScreen(),
      atomSvg: (context) => const SvgDetailScreen(),
      atomFavoriteTag: (context) => const FavoriteTagDetailScreen(),
      atomDotIndicator: (context) => const DotIndicatorScreen(),
      atomStatCard: (context) => const StatCardScreen(),

      // Molecules
      moleculeCard: (context) => const CardDetailScreen(),
      moleculeTypeTag: (context) => const TypeTagDetailScreen(),
      moleculeSearchBar: (context) => const SearchBarDetailScreen(),
      moleculeGenderBar: (context) => const GenderBarScreen(),
      moleculeSwipeableCard: (context) => const SwipeableCardShowcaseScreen(),
      moleculeBottomNavigationBar: (context) => const BottomNavigationBarShowcaseScreen(),

      // Organisms
      organismFilterBottomSheet: (context) => const FilterBottomSheetScreen(),
      organismHeroImageHeader: (context) => const HeroImageHeaderScreen(),

      // Templates
      templateOnboarding: (context) => const OnboardingTemplateScreen(),
      templateEmptyState: (context) => const EmptyStateTemplateScreen(),
      templatePokemonDetail: (context) => const PokemonDetailTemplateScreen(),
      templateHome: (context) => const HomeTemplateScreen(),
    };
  }

  /// Modelo para representar un componente en el showcase
  static List<ComponentCategory> getComponentCategories() {
    return [
      ComponentCategory(
        name: 'Atoms',
        description: 'Basic building blocks of the design system',
        icon: Icons.widgets,
        route: atoms,
        components: [
          ComponentItem(
            name: 'App Button',
            description: 'Interactive buttons with multiple styles, sizes, and states',
            icon: Icons.smart_button,
            route: atomButton,
          ),
          ComponentItem(
            name: 'App Image',
            description: 'Network image component with different sizes and fit options',
            icon: Icons.image,
            route: atomImage,
          ),
          ComponentItem(
            name: 'App SVG',
            description: 'SVG image component for scalable vector graphics',
            icon: Icons.image_search,
            route: atomSvg,
          ),
          ComponentItem(
            name: 'App Favorite Tag',
            description: 'Interactive favorite/star component with animations',
            icon: Icons.star_border,
            route: atomFavoriteTag,
          ),
          ComponentItem(
            name: 'Dot Indicator',
            description: 'Pagination indicators with dots and bars variants',
            icon: Icons.fiber_manual_record,
            route: atomDotIndicator,
          ),
          ComponentItem(
            name: 'Stat Card',
            description: 'Display statistics and metrics with icon, label and value',
            icon: Icons.analytics,
            route: atomStatCard,
          ),
        ],
      ),
      ComponentCategory(
        name: 'Molecules',
        description: 'Combinations of atoms forming simple UI patterns',
        icon: Icons.view_module,
        route: molecules,
        components: [
          ComponentItem(
            name: 'App Card',
            description: 'Pokemon cards with image, types, and favorite button',
            icon: Icons.credit_card,
            route: moleculeCard,
          ),
          ComponentItem(
            name: 'Type Tag',
            description: 'Pokemon type badges with colors and icons',
            icon: Icons.label,
            route: moleculeTypeTag,
          ),
          ComponentItem(
            name: 'Search Bar',
            description: 'Search input with icon and clear functionality',
            icon: Icons.search,
            route: moleculeSearchBar,
          ),
          ComponentItem(
            name: 'Gender Bar',
            description: 'Visualize gender distribution with animated bars',
            icon: Icons.wc,
            route: moleculeGenderBar,
          ),
          ComponentItem(
            name: 'Swipeable Card',
            description: 'Cards with swipe actions (delete, archive, etc.)',
            icon: Icons.swipe,
            route: moleculeSwipeableCard,
          ),
          ComponentItem(
            name: 'Bottom Navigation Bar',
            description: 'Navigation bar with icons and labels',
            icon: Icons.navigation,
            route: moleculeBottomNavigationBar,
          ),
        ],
      ),
      ComponentCategory(
        name: 'Organisms',
        description: 'Complex components made of molecules and atoms',
        icon: Icons.dashboard,
        route: organisms,
        components: [
          ComponentItem(
            name: 'Filter Bottom Sheet',
            description: 'Bottom sheet with filter sections and apply/reset actions',
            icon: Icons.filter_alt,
            route: organismFilterBottomSheet,
          ),
          ComponentItem(
            name: 'Hero Image Header',
            description: 'Reusable header with hero image, gradient and decorations',
            icon: Icons.wallpaper,
            route: organismHeroImageHeader,
          ),
        ],
      ),
      ComponentCategory(
        name: 'Templates',
        description: 'Page-level layouts combining multiple organisms',
        icon: Icons.view_carousel,
        route: templates,
        components: [
          ComponentItem(
            name: 'Onboarding Template',
            description: 'Multi-page onboarding flow with pagination',
            icon: Icons.auto_stories,
            route: templateOnboarding,
          ),
          ComponentItem(
            name: 'Empty State Template',
            description: 'Empty state screens with illustrations and actions',
            icon: Icons.inbox,
            route: templateEmptyState,
          ),
          ComponentItem(
            name: 'Pokemon Detail Template',
            description: 'Full Pokemon detail page with all information',
            icon: Icons.pets,
            route: templatePokemonDetail,
          ),
          ComponentItem(
            name: 'Home Template',
            description: 'Main app wrapper with bottom navigation bar',
            icon: Icons.home_filled,
            route: templateHome,
          ),
        ],
      ),
    ];
  }
}

/// Modelo para una categoría de componentes
class ComponentCategory {
  final String name;
  final String description;
  final IconData icon;
  final String route;
  final List<ComponentItem> components;

  ComponentCategory({
    required this.name,
    required this.description,
    required this.icon,
    required this.route,
    required this.components,
  });
}

/// Modelo para un componente individual
class ComponentItem {
  final String name;
  final String description;
  final IconData icon;
  final String route;

  ComponentItem({
    required this.name,
    required this.description,
    required this.icon,
    required this.route,
  });
}
