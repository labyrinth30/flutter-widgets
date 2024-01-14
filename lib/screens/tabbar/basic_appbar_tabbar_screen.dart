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
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  indicatorColor: Colors.red,
                  indicatorWeight: 4.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  labelColor: Colors.amber,
                  unselectedLabelColor: Colors.blue,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  tabs: TABS
                      .map(
                        (e) => Tab(
                          icon: Icon(e.icon),
                          child: Text(e.label),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          title: const Text('Basic AppBar TabBar Screen'),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: TABS
              .map(
                (e) => Center(
                  child: Icon(
                    e.icon,
                    size: 30.0,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
