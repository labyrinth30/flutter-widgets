import 'package:flutter/material.dart';
import 'package:flutter_widgets/const/tabs/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TABS.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: TabBar(
            tabs: TABS
                .map(
                  (e) => Tab(
                    icon: Icon(e.icon),
                    child: Text(e.label),
                  ),
                )
                .toList(),
          ),
          title: const Text('Basic AppBar TabBar Screen'),
        ),
        body: const Column(
          children: [
            Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
