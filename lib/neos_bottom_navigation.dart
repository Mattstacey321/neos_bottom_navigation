/*
Initial development sponsored by Zaynin Pty (Ltd)
*/

import 'package:flutter/material.dart';
import 'package:neos_bottom_navigation/styles/color_style.dart';
import 'neos_bottom_navigation_item.dart';
import 'neos_bottom_navigation_item_tile.dart';

class NeosBottomNavigation extends StatefulWidget {
  NeosBottomNavigation({
    required this.items,
    this.backgroundColor = Colors.white,
    this.itemBackgroudnColor = const Color(0XFF0277BD),
    this.itemOutlineColor = const Color(0XFFFFFFFF),
    this.selectedItemColor = const Color(0XFFFFFFFF),
    this.unselectedItemColor = const Color(0XFFFFFFFF),
    required this.onTap,
    this.setIndex = 0,
    this.selectedNavColor = ColorStyle.defaultGradient,
    this.activeColor = const Color(0xFF039BE5),
    this.inActiveColor = const Color(0xFF01579B),
  })  : assert(items.isNotEmpty),
        assert(items.length > 1 && items.length < 6);

  final List<NeosBottomNavigationItem> items;
  final Color backgroundColor;
  final Color itemBackgroudnColor;
  final Color itemOutlineColor;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final ValueChanged<int> onTap;
  final int setIndex;
  final Gradient selectedNavColor;
  final Color activeColor;
  final Color inActiveColor;
  @override
  _NeosBottomNavigationState createState() => _NeosBottomNavigationState();
}

class _NeosBottomNavigationState extends State<NeosBottomNavigation> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _buildBackground(),
          _buildItems(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 3,
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 3)),
          BoxShadow(
              blurRadius: 8,
              spreadRadius: 3,
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 5)),
          BoxShadow(
              blurRadius: 14,
              spreadRadius: 3,
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 1)),
        ],
      ),
      child: Container(
        width: double.infinity,
        height: 75.0 + MediaQuery.of(context).padding.bottom,
        color: widget.backgroundColor,
      ),
    );
  }

  Widget _buildItems() {
    return SafeArea(
      top: false,
      child: Container(
        height: 110.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.items.map((item) {
            int index = widget.items.indexOf(item);
            return NeosBottomNavigationItemTile(
                item,
                widget.selectedItemColor,
                widget.unselectedItemColor,
                widget.itemOutlineColor,
                widget.backgroundColor,
                widget.itemBackgroudnColor,
                index,
                _changeCurrentIndex,
                _currentIndex,
                widget.selectedNavColor,
                widget.activeColor,
                widget.inActiveColor);
          }).toList(),
        ),
      ),
    );
  }

  void _changeCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });

    widget.onTap(_currentIndex);
  }
}
