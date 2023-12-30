import 'package:flutter/material.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic AppBar TabBar Screen'),
      ),
      body: const Center(
        child: Column(
          children: [
            Column(
              children: [
                Text('Basic AppBar TabBar Screen'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
