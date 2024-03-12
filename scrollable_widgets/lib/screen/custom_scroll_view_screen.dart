import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';

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
  // covariant - 상속된 클래스도 사용가능
  // oldDelegate - build가 실행이 됐을 때 이전 Delegate
  // this - 새로운 Delegate
  // shouldRebuild - 새로 build를 해야할지 말지 결정
  // false - build 안 함, true - build 다시 함
  bool shouldRebuild(_SliverFixedHeaderDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
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
          renderSliverAppbar(),
          renderHeader(),
          renderBuilderSliverList(),
          renderHeader(),
          renderSliverGridBuilder(),
          renderBuilderSliverList()
        ],
      ),
    );
  }

  SliverPersistentHeader renderHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverFixedHeaderDelegate(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              '헤응응',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        minHeight: 75,
        maxHeight: 150,
      ),
    );
  }

  // Appbar
  SliverAppBar renderSliverAppbar() {
    return SliverAppBar(
      // 스크롤 했을 때 리스트의 중간에도 Appbar가 내려오게 할 수 있음
      floating: true,
      // 완전 고정
      pinned: false,
      // 자석 효과
      // floation이 true에만 사용가능
      snap: true,
      // 맨 위에서 한계 이상으로 스크롤 했을 때 남는 공간을 차지
      stretch: true,

      expandedHeight: 200,
      collapsedHeight: 150,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset('asset/img/image_1.jpeg', fit: BoxFit.cover),
        title: Text('FlexibleSpace'),
      ),
      title: Text('CustomScrollViewScreen'),
    );
  }

  // ListView 기본 생성자와 유사함
  SliverList renderChildSliverList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        numbers
            .map((e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e))
            .toList(),
      ),
    );
  }

  // ListView.builder 생성자와 유사함
  SliverList renderBuilderSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return renderContainer(
            color: rainbowColors[index % rainbowColors.length],
            index: index,
          );
        },
        childCount: 100,
      ),
    );
  }

  // GridView.count와 유사함
  SliverGrid renderChildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildListDelegate(
        numbers
            .map(
              (e) => renderContainer(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }

  // GridView.builder 와 비슷함
  SliverGrid renderSliverGridBuilder() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return renderContainer(
          color: rainbowColors[index % rainbowColors.length],
          index: index,
        );
      }, childCount: 100),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
      ),
    );
  }

  Widget renderContainer({
    required Color color,
    required int? index,
    double? height,
  }) {
    print(index);
    return Container(
      height: height ?? 300,
      color: color,
      child: Center(
        child: Text(
          index.toString(),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30.0),
        ),
      ),
    );
  }
}
