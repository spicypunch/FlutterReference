import 'home_screen.dart';
import 'package:flutter/material.dart';


void main() {
  // 플러터 프레임워크가 앱을 실행할 준비가 될 때까지 기다린다.
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    )
  );
}
