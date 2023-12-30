import 'package:flutter/material.dart';
import 'package:flutter_widgets/screens/tabbars/basic_appbar_tabbar_screen.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
    );
  }
}
