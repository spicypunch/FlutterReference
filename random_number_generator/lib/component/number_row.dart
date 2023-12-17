import 'package:flutter/material.dart';

class NumberRow extends StatelessWidget {
  final int num;

  const NumberRow({required this.num, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: num
          .toString()
          .split('')
          .map(
            (e) => Image.asset(
              'asset/img/$e.png',
              width: 50.0,
              height: 70.0,
            ),
          )
          .toList(),
    );
  }
}
