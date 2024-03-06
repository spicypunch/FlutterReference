import 'package:flutter/material.dart';
import 'package:scrollable_widgets/const/colors.dart';
import 'package:scrollable_widgets/layout/main_layout.dart';

class ListViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(100, (index) => index);

  ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'ListViewScreen',
      body: renderDefault(),
    );
  }

  // 빌드 되는 순간 한 번에 다 그림
  Widget renderDefault() {
    return ListView(
      children: numbers
          .map(
            (e) =>
            renderContainer(
                color: rainbowColors[e % rainbowColors.length], index: e),
      )
          .toList(),
    );
  }

  // 필요한 부분만 그림
  Widget renderBuilder() {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
    );
  }

  // 필요한 부분만 그리고 중간에 필요한 위젯을 넣을 수 있음
  Widget renderSeparated() {
    return ListView.separated(
      itemCount: 100,
      itemBuilder: (context, index) {
        return renderContainer(
            color: rainbowColors[index % rainbowColors.length], index: index);
      },
      separatorBuilder: (context, index) {
        // 5개의 item마다 배너 보여주기
        if (index % 5 == 0) {
          return renderContainer(
              color: Colors.black, index: index, height: 100);
        }
        return Container();
      },
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
