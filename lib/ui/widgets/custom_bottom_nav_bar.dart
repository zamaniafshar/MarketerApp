import 'package:flutter/material.dart';
import 'package:marketer/utils/custom_icons.dart';
import 'package:marketer/utils/extensions.dart';

const Color _unSelectedItemColor = Colors.white38;
const Color _selectedItemColor = Colors.white;

class _CustomBottomNavBarItem {
  final IconData icon;
  final IconData? activeIcon;

  const _CustomBottomNavBarItem({
    required this.icon,
    this.activeIcon,
  });
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int newIndex) onTap;
  static const List<_CustomBottomNavBarItem> _items = const [
    _CustomBottomNavBarItem(icon: CustomIcons.users),
    _CustomBottomNavBarItem(icon: CustomIcons.store_1),
  ];

  CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          color: Colors.indigo,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _items.widgetBuilder(
              builder: (index, item) => _CustomItem(
                isSelected: currentIndex == index,
                index: index,
                item: item,
                onTap: onTap,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomItem extends StatelessWidget {
  final bool isSelected;
  final int index;
  final _CustomBottomNavBarItem item;
  final void Function(int index) onTap;
  const _CustomItem({
    required this.isSelected,
    required this.index,
    required this.item,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        item.icon,
        color: isSelected ? _selectedItemColor : _unSelectedItemColor,
      ),
      onPressed: () {
        onTap(index);
      },
    );
  }
}
