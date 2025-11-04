import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';
import 'screens/home_screen.dart';
import 'screens/atoms_screen.dart';
import 'screens/molecules_screen.dart';
import 'screens/organisms_screen.dart';
import 'screens/templates_screen.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design System Showcase',
      theme: AppTheme.lightTheme.copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      routes: {
        '/atoms': (context) => const AtomsScreen(),
        '/molecules': (context) => const MoleculesScreen(),
        '/organisms': (context) => const OrganismsScreen(),
        '/templates': (context) => const TemplatesScreen(),
      },
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 0});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const AtomsScreen(),
    const MoleculesScreen(),
    const OrganismsScreen(),
    const TemplatesScreen(),
  ];

  final List<String> _titles = [
    'Home',
    'Atoms',
    'Molecules',
    'Organisms',
    'Templates',
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        backgroundColor: AppColors.primary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Text(
                'Design System\nShowcase',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text('Atoms'),
              selected: _selectedIndex == 1,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/atoms');
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_module),
              title: const Text('Molecules'),
              selected: _selectedIndex == 2,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/molecules');
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Organisms'),
              selected: _selectedIndex == 3,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/organisms');
              },
            ),
            ListTile(
              leading: const Icon(Icons.view_carousel),
              title: const Text('Templates'),
              selected: _selectedIndex == 4,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/templates');
              },
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
