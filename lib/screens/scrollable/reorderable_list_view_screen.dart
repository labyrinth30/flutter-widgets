import 'package:flutter/material.dart';
import 'package:flutter_widgets/const/colors.dart';
import 'package:flutter_widgets/layout/default_layout.dart';

class ReorderableListViewScreen extends StatefulWidget {
  const ReorderableListViewScreen({super.key});

  @override
  State<ReorderableListViewScreen> createState() =>
      _ReorderableListViewScreenState();
}

class _ReorderableListViewScreenState extends State<ReorderableListViewScreen> {
  List<int> numbers = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'RelorderablelistViewScreen',
      child: renderBuilder(),
    );
  }

  // 1
  // 기본적인 ReorderableListView
  Widget renderDefault() {
    return ReorderableListView(
      children: numbers
          .map((index) => renderContainer(
                color: rainbowColors[index % rainbowColors.length],
                index: index,
              ))
          .toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          // oldIndex와 newIndex 모두 이동 되기 전에 산정한다.
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
      },
    );
  }

  // 2
  // ReorderableListView.builder
  Widget renderBuilder() {
    return ReorderableListView.builder(
      itemCount: numbers.length,
      itemBuilder: (context, index) {
        return renderContainer(
          color: rainbowColors[numbers[index] % rainbowColors.length],
          index: numbers[index],
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          // oldIndex와 newIndex 모두 이동 되기 전에 산정한다.
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = numbers.removeAt(oldIndex);
          numbers.insert(newIndex, item);
        });
      },
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
      key: Key(
        index.toString(),
      ),
      color: color,
      height: height ?? 200,
      child: Center(
        child: Text(
          index.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
