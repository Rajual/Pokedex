import 'package:flutter/material.dart';

/// Tamaños de CustomSearchBar
enum SearchBarSize {
  small,    // Compacta
  medium,   // Estándar
  large,    // Expandida
}

extension SearchBarSizeExtension on SearchBarSize {
  double get height {
    return switch (this) {
      SearchBarSize.small => 40,
      SearchBarSize.medium => 48,
      SearchBarSize.large => 56,
    };
  }

  double get fontSize {
    return switch (this) {
      SearchBarSize.small => 12,
      SearchBarSize.medium => 14,
      SearchBarSize.large => 16,
    };
  }

  double get padding {
    return switch (this) {
      SearchBarSize.small => 8,
      SearchBarSize.medium => 12,
      SearchBarSize.large => 16,
    };
  }

  double get borderRadius {
    return switch (this) {
      SearchBarSize.small => 12,
      SearchBarSize.medium => 16,
      SearchBarSize.large => 20,
    };
  }

  double get iconSize {
    return switch (this) {
      SearchBarSize.small => 18,
      SearchBarSize.medium => 20,
      SearchBarSize.large => 24,
    };
  }
}

/// CustomSearchBar molecule para búsqueda de Pokémon
/// 
/// Ejemplo:
/// ```dart
/// CustomSearchBar(
///   hintText: 'Buscar Pokémon...',
///   onChanged: (value) {
///     setState(() => searchQuery = value);
///   },
///   onSearch: (value) {
///     print('Searching for: $value');
///   },
/// )
/// ```
class CustomSearchBar extends StatefulWidget {
  /// Texto de placeholder
  final String hintText;

  /// Callback cuando cambia el texto
  final Function(String) onChanged;

  /// Callback cuando se busca (tap en buscar)
  final Function(String)? onSearch;

  /// Callback cuando se limpia
  final Function()? onClear;

  /// Tamaño del CustomSearchBar
  final SearchBarSize size;

  /// Color de fondo
  final Color backgroundColor;

  /// Color del texto
  final Color textColor;

  /// Color del hint
  final Color hintColor;

  /// Color del icono
  final Color iconColor;

  /// Si está habilitado
  final bool isEnabled;

  /// Mostrar icono de búsqueda
  final bool showSearchIcon;

  /// Mostrar icono de limpiar
  final bool showClearIcon;

  /// Texto inicial
  final String initialText;

  /// Si tiene borde
  final bool hasBorder;

  /// Color del borde
  final Color borderColor;

  const CustomSearchBar({
    required this.onChanged,
    this.hintText = 'Buscar...',
    this.onSearch,
    this.onClear,
    this.size = SearchBarSize.medium,
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.textColor = const Color(0xFF333333),
    this.hintColor = const Color(0xFF999999),
    this.iconColor = const Color(0xFF666666),
    this.isEnabled = true,
    this.showSearchIcon = true,
    this.showClearIcon = true,
    this.initialText = '',
    this.hasBorder = false,
    this.borderColor = const Color(0xFFE0E0E0),
    super.key,
  });

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _focusNode = FocusNode();
    _controller.addListener(_handleControllerChange);
  }

  void _handleControllerChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleClear() {
    _controller.clear();
    widget.onChanged('');
    widget.onClear?.call();
    _focusNode.requestFocus();
  }

  void _handleSearch() {
    widget.onSearch?.call(_controller.text);
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.size.height;
    final padding = widget.size.padding;
    final borderRadius = widget.size.borderRadius;
    final iconSize = widget.size.iconSize;
    final fontSize = widget.size.fontSize;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: widget.hasBorder
            ? Border.all(color: widget.borderColor, width: 1.5)
            : null,
      ),
      child: Row(
        children: [
          // Leading search icon
          if (widget.showSearchIcon)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding / 2),
              child: Icon(
                Icons.search,
                size: iconSize,
                color: widget.iconColor,
              ),
            ),
          // Text field
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.isEnabled,
              onChanged: widget.onChanged,
              onSubmitted: (_) => _handleSearch(),
              style: TextStyle(
                color: widget.textColor,
                fontSize: fontSize,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: widget.hintColor,
                  fontSize: fontSize,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: padding / 2,
                  vertical: padding / 4,
                ),
              ),
            ),
          ),
          // Trailing clear icon
          if (widget.showClearIcon && _controller.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding / 2),
              child: GestureDetector(
                onTap: _handleClear,
                child: Icon(
                  Icons.close,
                  size: iconSize,
                  color: widget.iconColor,
                ),
              ),
            ),
          // Trailing search button
          if (widget.showSearchIcon)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding / 2),
              child: GestureDetector(
                onTap: _handleSearch,
                child: Icon(
                  Icons.search,
                  size: iconSize,
                  color: widget.iconColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
