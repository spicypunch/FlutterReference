import 'package:flutter/material.dart';

class BasicText extends StatelessWidget {
  const BasicText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hello World',
      style: TextStyle(color: Colors.white, fontSize: 28),
    );
  }
}