import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  const SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: rainbowColors
              .map(
                (e) => renderContainer(color: e),
              )
              .toList(),
        ),
      ),
    );
  }

  // 1
  // 기본 렌더링 법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
          children: rainbowColors
              .map(
                (e) => renderContainer(color: e),
              )
              .toList()),
    );
  }

  // 2
  // 스크롤 강제 적용
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  // 3
  // 스크롤 해도 위젯이 잘리지 않게 하기
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainer(color: Colors.black),
        ],
      ),
    );
  }

  Widget renderContainer({
    required Color color,
  }) {
    return Container(
      height: 300,
      color: color,
    );
  }
}
