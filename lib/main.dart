import 'package:flutter/material.dart';
import 'package:pokedex/core/design_system/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: AppTheme.lightTheme,
      home:  AppButton(
        
        label: 'Press Me',
        onPressed: () {
          
        },
        isEnabled: true,
        isLoading: true,
        leadingIcon: Icons.pets,
        trailingIcon: Icons.arrow_forward,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
      ),
      body: const Center(
        child: Text('Welcome to Pokédex'),
      ),
    );
  }
}
