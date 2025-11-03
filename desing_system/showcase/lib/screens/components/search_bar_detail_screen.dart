import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class SearchBarDetailScreen extends StatefulWidget {
  const SearchBarDetailScreen({super.key});

  @override
  State<SearchBarDetailScreen> createState() => _SearchBarDetailScreenState();
}

class _SearchBarDetailScreenState extends State<SearchBarDetailScreen> {
  String _searchQuery = '';
  bool _showClearIcon = true;
  bool _showSearchIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Search Bar'),
        backgroundColor: AppColors.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle(context, 'Basic Search Bar'),
          _buildComponentCard(
            child: Column(
              children: [
                CustomSearchBar(
                  hintText: 'Search Pokémon...',
                  onChanged: (query) => setState(() => _searchQuery = query),
                  showClearIcon: _showClearIcon,
                  showSearchIcon: _showSearchIcon,
                ),
                const SizedBox(height: 8),
                Text('Current query: "$_searchQuery"'),
              ],
            ),
            codeSnippet: '''
CustomSearchBar(
  hintText: 'Search Pokémon...',
  onChanged: (query) {
    // Handle search query changes
    setState(() => searchQuery = query);
  },
  showClearIcon: true,
  showSearchIcon: true,
)''',
          ),

          _buildSectionTitle(context, 'Icon Configuration'),
          _buildComponentCard(
            child: Column(
              children: [
                const Text('With both icons:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                CustomSearchBar(
                  hintText: 'Search with icons...',
                  onChanged: (query) {},
                  showClearIcon: true,
                  showSearchIcon: true,
                ),
                const SizedBox(height: 16),
                const Text('Search icon only:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                CustomSearchBar(
                  hintText: 'Search icon only...',
                  onChanged: (query) {},
                  showClearIcon: false,
                  showSearchIcon: true,
                ),
                const SizedBox(height: 16),
                const Text('Clear icon only:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                CustomSearchBar(
                  hintText: 'Clear icon only...',
                  onChanged: (query) {},
                  showClearIcon: true,
                  showSearchIcon: false,
                ),
                const SizedBox(height: 16),
                const Text('No icons:', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                CustomSearchBar(
                  hintText: 'No icons...',
                  onChanged: (query) {},
                  showClearIcon: false,
                  showSearchIcon: false,
                ),
              ],
            ),
            codeSnippet: '''
// With both icons (default)
CustomSearchBar(
  hintText: 'Search...',
  onChanged: (query) {},
  showClearIcon: true,
  showSearchIcon: true,
)

// Search icon only
CustomSearchBar(
  hintText: 'Search...',
  onChanged: (query) {},
  showClearIcon: false,
  showSearchIcon: true,
)

// Clear icon only
CustomSearchBar(
  hintText: 'Search...',
  onChanged: (query) {},
  showClearIcon: true,
  showSearchIcon: false,
)

// No icons
CustomSearchBar(
  hintText: 'Search...',
  onChanged: (query) {},
  showClearIcon: false,
  showSearchIcon: false,
)''',
          ),

          _buildSectionTitle(context, 'Different Hint Texts'),
          _buildComponentCard(
            child: Column(
              children: [
                CustomSearchBar(
                  hintText: 'Buscar Pokémon...',
                  onChanged: (query) {},
                ),
                const SizedBox(height: 16),
                CustomSearchBar(
                  hintText: 'Find your favorite Pokemon',
                  onChanged: (query) {},
                ),
                const SizedBox(height: 16),
                CustomSearchBar(
                  hintText: 'Search by name or number',
                  onChanged: (query) {},
                ),
              ],
            ),
            codeSnippet: '''
CustomSearchBar(
  hintText: 'Buscar Pokémon...',
  onChanged: (query) {},
)

CustomSearchBar(
  hintText: 'Find your favorite Pokemon',
  onChanged: (query) {},
)

CustomSearchBar(
  hintText: 'Search by name or number',
  onChanged: (query) {},
)''',
          ),

          _buildSectionTitle(context, 'Interactive Example'),
          _buildComponentCard(
            child: Column(
              children: [
                CustomSearchBar(
                  hintText: 'Type to see real-time search...',
                  onChanged: (query) => setState(() => _searchQuery = query),
                  showClearIcon: true,
                  showSearchIcon: true,
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search Results for: "$_searchQuery"',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      if (_searchQuery.isEmpty)
                        const Text('Start typing to see search results...')
                      else if (_searchQuery.toLowerCase().contains('pika'))
                        const Text('• Pikachu\n• Pichu\n• Plusle\n• Minun')
                      else if (_searchQuery.toLowerCase().contains('char'))
                        const Text('• Charmander\n• Charmeleon\n• Charizard')
                      else if (_searchQuery.toLowerCase().contains('bulb'))
                        const Text('• Bulbasaur\n• Chikorita\n• Treecko\n• Snivy')
                      else
                        Text('No Pokemon found for "$_searchQuery"'),
                    ],
                  ),
                ),
              ],
            ),
            codeSnippet: '''
class _MyWidgetState extends State<MyWidget> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(
          hintText: 'Search Pokemon...',
          onChanged: (query) => setState(() => searchQuery = query),
        ),
        // Use searchQuery for filtering
        Text('Searching for: \$searchQuery'),
      ],
    );
  }
}''',
          ),

          _buildSectionTitle(context, 'Usage Notes'),
          Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CustomSearchBar Component Notes:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '• Real-time search with onChanged callback\n'
                    '• Configurable icons (search and clear)\n'
                    '• Customizable hint text\n'
                    '• Automatic text clearing with clear icon\n'
                    '• Consistent styling with design system\n'
                    '• Perfect for filtering lists and data\n'
                    '• Supports all text input features',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
      ),
    );
  }

  Widget _buildComponentCard({required Widget child, required String codeSnippet}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child,
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('View Code'),
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    codeSnippet,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}