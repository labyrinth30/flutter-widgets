// tab에 대한 데이터를 가지고 있는 파일
import 'package:flutter/material.dart';

class TabInfo {
  final String label;
  final IconData icon;

  const TabInfo({
    required this.label,
    required this.icon,
  });
}

final TABS = [
  const TabInfo(
    label: 'Home',
    icon: Icons.home,
  ),
  const TabInfo(
    label: 'Search',
    icon: Icons.search,
  ),
  const TabInfo(
    label: 'Add',
    icon: Icons.add,
  ),
  const TabInfo(
    label: 'Like',
    icon: Icons.favorite,
  ),
  const TabInfo(
    label: 'Profile',
    icon: Icons.person,
  ),
];
