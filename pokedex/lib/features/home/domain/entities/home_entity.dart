/// Domain entity for home data
class HomeData {
  /// Title text for the home screen
  final String title;

  /// Welcome message
  final String welcomeMessage;

  /// List of navigation items for the bottom navigation bar
  final List<HomeNavigationItem> navigationItems;

  /// List of pages/widgets to display for each navigation item
  final List<String> pageRoutes;

  const HomeData({
    required this.title,
    required this.welcomeMessage,
    required this.navigationItems,
    required this.pageRoutes,
  });

  /// Creates a copy of this HomeData with the given fields replaced
  HomeData copyWith({
    String? title,
    String? welcomeMessage,
    List<HomeNavigationItem>? navigationItems,
    List<String>? pageRoutes,
  }) {
    return HomeData(
      title: title ?? this.title,
      welcomeMessage: welcomeMessage ?? this.welcomeMessage,
      navigationItems: navigationItems ?? this.navigationItems,
      pageRoutes: pageRoutes ?? this.pageRoutes,
    );
  }
}

/// Domain entity for a navigation item in the home screen
class HomeNavigationItem {
  /// Icon name/path for the navigation item
  final String iconName;

  /// Label text for the navigation item
  final String label;

  /// Route name associated with this navigation item
  final String routeName;

  const HomeNavigationItem({
    required this.iconName,
    required this.label,
    required this.routeName,
  });

  /// Creates a copy of this HomeNavigationItem with the given fields replaced
  HomeNavigationItem copyWith({
    String? iconName,
    String? label,
    String? routeName,
  }) {
    return HomeNavigationItem(
      iconName: iconName ?? this.iconName,
      label: label ?? this.label,
      routeName: routeName ?? this.routeName,
    );
  }
}

/// Domain entity for home configuration
class HomeConfig {
  /// Initial selected tab index
  final int initialSelectedIndex;

  /// Whether to keep pages alive when switching tabs
  final bool keepPagesAlive;

  /// Active color for navigation items
  final String? activeColorHex;

  /// Inactive color for navigation items
  final String? inactiveColorHex;

  /// Background color for navigation bar
  final String? navigationBarBackgroundColorHex;

  const HomeConfig({
    this.initialSelectedIndex = 0,
    this.keepPagesAlive = true,
    this.activeColorHex,
    this.inactiveColorHex,
    this.navigationBarBackgroundColorHex,
  });

  /// Creates a copy of this HomeConfig with the given fields replaced
  HomeConfig copyWith({
    int? initialSelectedIndex,
    bool? keepPagesAlive,
    String? activeColorHex,
    String? inactiveColorHex,
    String? navigationBarBackgroundColorHex,
  }) {
    return HomeConfig(
      initialSelectedIndex: initialSelectedIndex ?? this.initialSelectedIndex,
      keepPagesAlive: keepPagesAlive ?? this.keepPagesAlive,
      activeColorHex: activeColorHex ?? this.activeColorHex,
      inactiveColorHex: inactiveColorHex ?? this.inactiveColorHex,
      navigationBarBackgroundColorHex: navigationBarBackgroundColorHex ?? this.navigationBarBackgroundColorHex,
    );
  }
}