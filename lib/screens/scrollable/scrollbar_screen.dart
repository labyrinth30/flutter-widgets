import 'package:flutter/material.dart';
import 'package:flutter_widgets/const/colors.dart';
import 'package:flutter_widgets/layout/default_layout.dart';

class ScrollBarScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  ScrollBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'ScrollbarScreen',
      // Scrollbar : 스크롤바를 보여주는 위젯
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: numbers
                .map((e) => renderContainer(
                      color: rainbowColors[e % rainbowColors.length],
                      index: e,
                    ))
                .toList(),
          ),
        ),
      ),
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
