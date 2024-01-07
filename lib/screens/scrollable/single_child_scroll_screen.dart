import 'package:flutter/material.dart';
import 'package:flutter_widgets/const/colors.dart';
import 'package:flutter_widgets/layout/default_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  SingleChildScrollViewScreen({super.key});

  // 보통 Column을 넣어서 사용한다.

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'SingleChildScrollView',
      child: renderChildPerformance(),
    );
  }

  // 1
  // 기본 렌더링법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // 2
  //화면을 넘어가지 않아도 스크롤되게 하기
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics() : 스크롤이 되지 않는다.
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  // 3
  // 위젯이 잘리지 않게 하기
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  // 4
  // 여러가지 physics 정리
  Widget renderPhysics() {
    return SingleChildScrollView(
      // NeverScrollableScrollPhysics() : 스크롤이 되지 않는다.
      // AlwaysScrollableScrollPhysics() : 스크롤이 되지 않아도 스크롤이 된다.
      // BouncingScrollPhysics() : ios 스타일의 스크롤이 된다.
      // ClampingScrollPhysics() : Android 스타일의 스크롤이 된다.
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainer(
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }

  // 5
  // SingleChildScrollView 퍼포먼스
  Widget renderChildPerformance() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    int? index,
  }) {
    if (index != null) {
      print(index);
    }
    return Container(
      color: color,
      height: 300,
    );
  }
}
