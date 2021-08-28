library neos_bottom_navigation;

import 'package:flutter/material.dart';

class NeosBottomNavigationItem {
  NeosBottomNavigationItem({
    required this.icon,
    required this.title,
    this.titleTextColor = const Color(0XFFFFFFFF),
    this.routeName
  });
  final Icon icon;
  final String title;
  final Color titleTextColor;
  final String? routeName;
}
