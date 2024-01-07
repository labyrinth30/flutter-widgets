import 'package:flutter/material.dart';
import 'package:flutter_widgets/screens/scrollable/grid_view_screen.dart';
import 'package:flutter_widgets/screens/scrollable/list_view_screen.dart';
import 'package:flutter_widgets/screens/scrollable/single_child_scroll_screen.dart';
import 'package:flutter_widgets/screens/tabbar/basic_appbar_tabbar_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Scrollable'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SingleChildScrollViewScreen(),
                    ),
                  );
                },
                child: const Text('SingleChildScrollViewScreen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ListViewScreen(),
                    ),
                  );
                },
                child: const Text('List View Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const GridViewScreen(),
                    ),
                  );
                },
                child: const Text('Grid View Screen'),
              ),
              const Text('TabBar'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const BasicAppbarTabbarScreen(),
                    ),
                  );
                },
                child: const Text('Basic AppBar TabBar Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
