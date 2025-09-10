import 'package:flutter/material.dart';
import 'color_palette.dart';

class ChatTabSelector extends StatelessWidget {
  final String selectedTab;
  final void Function(String) onTabSelected;

  const ChatTabSelector({
    super.key,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0), // spacing from left edge
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _tabButton('All'),
          const SizedBox(width: 8),
          _tabButton('Favorite'),
        ],
      ),
    );
  }

  Widget _tabButton(String tab) {
    final bool isSelected = tab == selectedTab;
    return GestureDetector(
      onTap: () => onTabSelected(tab),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? ColorPalette.buttonBackground : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: Text(
          tab,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
