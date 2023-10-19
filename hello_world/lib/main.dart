import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0
            ),
          ),
        ),
      ),
    )
  );
}