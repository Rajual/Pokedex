import 'package:flutter/material.dart';
import 'package:desing_system/desing_system.dart';

class ButtonDetailScreen extends StatefulWidget {
  const ButtonDetailScreen({super.key});

  @override
  State<ButtonDetailScreen> createState() => _ButtonDetailScreenState();
}

class _ButtonDetailScreenState extends State<ButtonDetailScreen> {
  bool _isLoading = false;
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Button'),
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Primary Button'),
          _buildComponentCard(
            child: AppButton.fromProperties(
              label: 'Primary Button',
              onPressed: () => _showSnackBar('Primary button pressed'),
              type: ButtonType.primary,
            ),
            codeSnippet: '''
AppButton.fromProperties(
 label: 'Primary Button',
 onPressed: () => print('Pressed'),
 type: ButtonType.primary,
)''',
          ),

          _buildSectionTitle('Secondary Button'),
          _buildComponentCard(
            child: AppButton.fromProperties(
              label: 'Secondary Button',
              onPressed: () => _showSnackBar('Secondary button pressed'),
              type: ButtonType.secondary,
            ),
            codeSnippet: '''
AppButton.fromProperties(
 label: 'Secondary Button',
 onPressed: () => print('Pressed'),
 type: ButtonType.secondary,
)''',
          ),

          _buildSectionTitle('Tertiary Button'),
          _buildComponentCard(
            child: AppButton.fromProperties(
              label: 'Tertiary Button',
              onPressed: () => _showSnackBar('Tertiary button pressed'),
              type: ButtonType.tertiary,
            ),
            codeSnippet: '''
AppButton.fromProperties(
 label: 'Tertiary Button',
 onPressed: () => print('Pressed'),
 type: ButtonType.tertiary,
)''',
          ),

          _buildSectionTitle('Loading State'),
          _buildComponentCard(
            child: Column(
              children: [
                AppButton.fromProperties(
                  label: _isLoading ? 'Loading...' : 'Toggle Loading',
                  onPressed: _toggleLoading,
                  isLoading: _isLoading,
                  type: ButtonType.primary,
                ),
                const SizedBox(height: 8),
                Text('Loading: $_isLoading'),
              ],
            ),
            codeSnippet: '''
AppButton.fromProperties(
 label: 'Loading Button',
 onPressed: () => print('Pressed'),
 isLoading: true,
 type: ButtonType.primary,
)''',
          ),

          _buildSectionTitle('Disabled State'),
          _buildComponentCard(
            child: Column(
              children: [
                AppButton.fromProperties(
                  label: _isEnabled ? 'Disable Me' : 'Enable Me',
                  onPressed: _toggleEnabled,
                  isEnabled: _isEnabled,
                  type: ButtonType.secondary,
                ),
                const SizedBox(height: 8),
                Text('Enabled: $_isEnabled'),
              ],
            ),
            codeSnippet: '''
AppButton.fromProperties(
 label: 'Disabled Button',
 onPressed: () => print('Pressed'),
 isEnabled: false,
 type: ButtonType.primary,
)''',
          ),

          _buildSectionTitle('With Icons'),
          _buildComponentCard(
            child: Column(
              children: [
                AppButton.fromProperties(
                  label: 'Leading Icon',
                  onPressed: () => _showSnackBar('Leading icon pressed'),
                  leadingIcon: Icons.star,
                  type: ButtonType.primary,
                ),
                const SizedBox(height: 8),
                AppButton.fromProperties(
                  label: 'Trailing Icon',
                  onPressed: () => _showSnackBar('Trailing icon pressed'),
                  trailingIcon: Icons.arrow_forward,
                  type: ButtonType.secondary,
                ),
                const SizedBox(height: 8),
                AppButton.fromProperties(
                  label: 'Both Icons',
                  onPressed: () => _showSnackBar('Both icons pressed'),
                  leadingIcon: Icons.favorite,
                  trailingIcon: Icons.send,
                  type: ButtonType.primary,
                ),
              ],
            ),
            codeSnippet: '''
AppButton.fromProperties(
 label: 'With Icons',
 onPressed: () => print('Pressed'),
 leadingIcon: Icons.star,
 trailingIcon: Icons.arrow_forward,
 type: ButtonType.primary,
)''',
          ),

          _buildSectionTitle('Button Sizes'),
          _buildComponentCard(
            child: Column(
              children: [
                AppButton.fromProperties(
                  label: 'Small Button',
                  onPressed: () => _showSnackBar('Small pressed'),
                  size: ButtonSize.small,
                  type: ButtonType.primary,
                ),
                const SizedBox(height: 8),
                AppButton.fromProperties(
                  label: 'Medium Button',
                  onPressed: () => _showSnackBar('Medium pressed'),
                  size: ButtonSize.medium,
                  type: ButtonType.primary,
                ),
                const SizedBox(height: 8),
                AppButton.fromProperties(
                  label: 'Large Button',
                  onPressed: () => _showSnackBar('Large pressed'),
                  size: ButtonSize.large,
                  type: ButtonType.primary,
                ),
              ],
            ),
            codeSnippet: '''
AppButton.fromProperties(
 label: 'Small Button',
 onPressed: () => print('Pressed'),
 size: ButtonSize.small,
 type: ButtonType.primary,
)

AppButton.fromProperties(
 label: 'Medium Button',
 onPressed: () => print('Pressed'),
 size: ButtonSize.medium,
 type: ButtonType.primary,
)

AppButton.fromProperties(
 label: 'Large Button',
 onPressed: () => print('Pressed'),
 size: ButtonSize.large,
 type: ButtonType.primary,
)''',
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _toggleEnabled() {
    setState(() {
      _isEnabled = !_isEnabled;
    });
  }
}