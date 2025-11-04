import 'package:flutter/material.dart';
import 'models/custom_search_bar_ui_model.dart';

/// CustomSearchBar molecule para búsqueda de Pokémon
///
/// Ejemplo:
/// ```dart
/// CustomSearchBar(
///   uiModel: CustomSearchBarUiModel(
///     hintText: 'Buscar Pokémon...',
///   ),
///   onChanged: (value) {
///     setState(() => searchQuery = value);
///   },
///   onSearch: (value) {
///     print('Searching for: $value');
///   },
/// )
/// ```
class CustomSearchBar extends StatefulWidget {
  final CustomSearchBarUiModel uiModel;

  /// Callback cuando cambia el texto
  final Function(String) onChanged;

  /// Callback cuando se busca (tap en buscar)
  final Function(String)? onSearch;

  /// Callback cuando se limpia
  final Function()? onClear;

  const CustomSearchBar({
    required this.uiModel,
    required this.onChanged,
    this.onSearch,
    this.onClear,
    super.key,
  });

  /// Factory constructor for backward compatibility
  factory CustomSearchBar.fromProperties({
    required Function(String) onChanged,
    String hintText = 'Buscar...',
    Function(String)? onSearch,
    Function()? onClear,
    SearchBarSize size = SearchBarSize.medium,
    Color backgroundColor = const Color(0xFFF5F5F5),
    Color textColor = const Color(0xFF333333),
    Color hintColor = const Color(0xFF999999),
    Color iconColor = const Color(0xFF666666),
    bool isEnabled = true,
    bool showSearchIcon = true,
    bool showClearIcon = true,
    String initialText = '',
    bool hasBorder = false,
    Color borderColor = const Color(0xFFE0E0E0),
    Key? key,
  }) {
    return CustomSearchBar(
      uiModel: CustomSearchBarUiModel(
        hintText: hintText,
        size: size,
        backgroundColor: backgroundColor,
        textColor: textColor,
        hintColor: hintColor,
        iconColor: iconColor,
        isEnabled: isEnabled,
        showSearchIcon: showSearchIcon,
        showClearIcon: showClearIcon,
        initialText: initialText,
        hasBorder: hasBorder,
        borderColor: borderColor,
      ),
      onChanged: onChanged,
      onSearch: onSearch,
      onClear: onClear,
      key: key,
    );
  }

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.uiModel.initialText);
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
    final height = widget.uiModel.size.height;
    final padding = widget.uiModel.size.padding;
    final borderRadius = widget.uiModel.size.borderRadius;
    final iconSize = widget.uiModel.size.iconSize;
    final fontSize = widget.uiModel.size.fontSize;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: widget.uiModel.backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: widget.uiModel.hasBorder
            ? Border.all(color: widget.uiModel.borderColor, width: 1.5)
            : null,
      ),
      child: Row(
        children: [
          // Leading search icon
          if (widget.uiModel.showSearchIcon)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding / 2),
              child: Icon(
                Icons.search,
                size: iconSize,
                color: widget.uiModel.iconColor,
              ),
            ),
          // Text field
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.uiModel.isEnabled,
              onChanged: widget.onChanged,
              onSubmitted: (_) => _handleSearch(),
              style: TextStyle(
                color: widget.uiModel.textColor,
                fontSize: fontSize,
              ),
              decoration: InputDecoration(
                hintText: widget.uiModel.hintText,
                hintStyle: TextStyle(
                  color: widget.uiModel.hintColor,
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
          if (widget.uiModel.showClearIcon && _controller.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding / 2),
              child: GestureDetector(
                onTap: _handleClear,
                child: Icon(
                  Icons.close,
                  size: iconSize,
                  color: widget.uiModel.iconColor,
                ),
              ),
            ),
          // Trailing search button
          if (widget.uiModel.showSearchIcon)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding / 2),
              child: GestureDetector(
                onTap: _handleSearch,
                child: Icon(
                  Icons.search,
                  size: iconSize,
                  color: widget.uiModel.iconColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
