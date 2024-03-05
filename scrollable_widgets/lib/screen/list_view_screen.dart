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
      body: renderBuilder(),
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
              color: rainbowColors[index % rainbowColors.length],
              index: index);
        });
  }

  Widget renderContainer({
    required Color color,
    required int? index,
  }) {
    print(index);

    return Container(
      height: 300,
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
