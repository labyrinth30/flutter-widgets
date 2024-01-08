import 'package:flutter/material.dart';
import 'package:flutter_widgets/const/colors.dart';

class _SliverFixedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  _SliverFixedHeaderDelegate({
    required this.child,
    required this.maxHeight,
    required this.minHeight,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // 최대 높이
  double get maxExtent => maxHeight;

  @override
  // 최소 높이
  double get minExtent => minHeight;

  @override
  // covariant : 상속된 클래스도 사용 가능
  // oldDelegate : 오래된 Delegate, Build 되기 전 Delegate
  // this : 새로운 Delegate, Build 된 후 Delegate
  // shouldRebuild - 새로 build를 해야하는지 결정
  // false - 새로 build 하지 않음
  // true - 새로 build 함
  // 고로 특정 condition에 따라서 build를 할지 말지 결정 가능
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CustomScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);
  CustomScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          renderSliverAppBar(),
          renderHeader(),
          renderBuilderSliverList(),
          renderHeader(),
          renderSliverGridBuilder(),
          renderBuilderSliverList(),
        ],
      ),
    );
  }

  SliverPersistentHeader renderHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverFixedHeaderDelegate(
        maxHeight: 200,
        minHeight: 50,
        child: Container(
          color: Colors.black,
          child: const Center(
            child: Text(
              '신기하지~',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // AppBar
  SliverAppBar renderSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.blue,
      // 스크롤 했을 때 리스트의 중간에도 AppBar가 내려오게 할지 결정
      floating: true,
      // 스크롤을 했을 때도 AppBar가 고정되어 있을지 결정
      pinned: false,
      // 조금만 스크롤을 해도 AppBar가 내려오게 할지 결정
      // floating true 에만 사용 가능
      snap: true,
      // 맨 위에서 한계 이상으로 스크롤 했을 때
      // 남는 공간을 차지
      stretch: true,
      // 늘어났을 때 최대 사이즈
      expandedHeight: 200,
      // AppBar를 닫을 떄 빨려들어가는 구간
      collapsedHeight: 150,
      // AppBar에 이미지 넣기
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('SliverAppBar'),
        background: Image.network(
          'https://picsum.photos/200/300',
          fit: BoxFit.cover,
        ),
      ),

      title: const Text('SliverAppBar'),
    );
  }

  // 1
  // ListView 기본 생성자와 비슷함
  SliverList renderChildSliverList() {
    return SliverList(
      // delegate는 어떤 형태로 sliverList를 만들어낼지 결정한다.
      delegate: SliverChildListDelegate(numbers
          .map((index) => renderContainer(
                color: rainbowColors[index % rainbowColors.length],
                index: index,
              ))
          .toList()),
    );
  }

  // 2
  // ListView.builder와 비슷함
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        ),
        childCount: 100,
      ),
    );
  }

  // 3
  // GridView.count와 비슷함
  SliverGrid renderSliverGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      delegate: SliverChildListDelegate(numbers
          .map((index) => renderContainer(
                color: rainbowColors[index % rainbowColors.length],
                index: index,
              ))
          .toList()),
    );
  }

  // 4
  // GridView.builder와 비슷함
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        ),
        childCount: 100,
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
