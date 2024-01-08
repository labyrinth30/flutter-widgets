// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_widgets/const/colors.dart';
import 'package:flutter_widgets/layout/default_layout.dart';

class GridViewScreen extends StatelessWidget {
  List<int> numbers = List.generate(100, (index) => index);
  GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Grid View Screen',
      child: renderMaxExtent(),
    );
  }

  // 1
  // 기본 렌더링법, 한 번에 다 그림
  Widget renderCount() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      children: numbers
          .map(
            (index) => renderContainer(
              color: rainbowColors[index % rainbowColors.length],
              index: index,
            ),
          )
          .toList(),
    );
  }

  // 2
  // GridView.builder
  // 필요한 만큼만 렌더링
  Widget renderBuilderCrossAxisCount() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: ((context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      }),
      itemCount: 100,
    );
  }

  // 3
  // 최대 사이즈로 렌더링
  // SliverGridDelegateWithMaxCrossAxisExtent
  Widget renderMaxExtent() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
      ),
      itemBuilder: ((context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      }),
      itemCount: 100,
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
  }) {
    print(index);
    return Container(
      color: color,
      height: 300,
      child: Center(
        child: Text(
          '$index',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
