import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.black87],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: const StartScreen()),
    ),
  ));
}
