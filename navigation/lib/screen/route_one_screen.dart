import 'package:flutter/material.dart';
import 'package:navigation/layout/main_layout.dart';
import 'package:navigation/screen/route_two_screen.dart';

class RouteOneScreen extends StatelessWidget {
  final int? num;

  const RouteOneScreen({this.num, super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: '11111',
      children: [
        Text(
          'arguments: ${num.toString()}',
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {
            print(Navigator.of(context).canPop());
          },
          child: Text('Can Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          child: Text('Maybe Pop'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Pop'),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => RouteTwoScreen(),
                    settings: RouteSettings(arguments: 789)),
              );
            },
            child: Text("Push"))
      ],
    );
  }
}
