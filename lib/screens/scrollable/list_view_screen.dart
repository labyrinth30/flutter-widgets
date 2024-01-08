import 'package:flutter/material.dart';
import 'package:flutter_widgets/const/colors.dart';
import 'package:flutter_widgets/layout/default_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'List View',
      child: renderSeparated(),
    );
  }

  // 1
  // ListView.builder
  // 필요한 만큼만 렌더링
  Widget renderBuilder() {
    return ListView.builder(
      itemBuilder: ((context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      }),
      itemCount: 100,
    );
  }

  // 2
  // ListView.separated
  // 중간중간에 추가할 위젯을 넣을 수 있음
  Widget renderSeparated() {
    return ListView.separated(
      itemBuilder: ((context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      }),
      separatorBuilder: ((context, index) {
        // 5개의 item마다 배너 보여주기
        index += 1;
        if (index % 5 == 0) {
          return renderContainer(
            color: Colors.black,
            index: index,
            height: 50,
          );
        }
        return const SizedBox();
      }),
      itemCount: 100,
    );
  }

  Widget renderDefault() {
    return ListView(
      children: numbers
          .map(
            (e) => renderContainer(
              color: rainbowColors[e % rainbowColors.length],
              index: e,
            ),
          )
          .toList(),
    );
  }

  Widget renderContainer({
    required Color color,
    required int index,
    double? height,
  }) {
    print(index);
    return Container(
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
