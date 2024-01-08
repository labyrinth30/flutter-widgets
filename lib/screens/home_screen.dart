import 'package:flutter/material.dart';
import 'package:flutter_widgets/layout/default_layout.dart';
import 'package:flutter_widgets/screens/scrollable/grid_view_screen.dart';
import 'package:flutter_widgets/screens/scrollable/list_view_screen.dart';
import 'package:flutter_widgets/screens/scrollable/reorderable_list_view_screen.dart';
import 'package:flutter_widgets/screens/scrollable/single_child_scroll_screen.dart';
import 'package:flutter_widgets/screens/tabbar/basic_appbar_tabbar_screen.dart';

class ScreenModel {
  final WidgetBuilder builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name,
  });
}

class HomeScreen extends StatelessWidget {
  final screens = [
    ScreenModel(
      builder: (context) => SingleChildScrollViewScreen(),
      name: 'SingleChildScrollView',
    ),
    ScreenModel(
      builder: (context) => ListViewScreen(),
      name: 'ListView',
    ),
    ScreenModel(
      builder: (context) => GridViewScreen(),
      name: 'GridView',
    ),
    ScreenModel(
      builder: (context) => const ReorderableListViewScreen(),
      name: 'ReorderableListView',
    ),
    ScreenModel(
      builder: (context) => const BasicAppbarTabbarScreen(),
      name: 'Basic AppBar TabBar',
    ),
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: screens
                .map(
                  (screen) => ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: screen.builder,
                        ),
                      );
                    },
                    child: Text(
                      screen.name,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
