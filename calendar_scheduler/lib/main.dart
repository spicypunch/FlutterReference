import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting();

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: "NotoSans"
      ),
      home: HomeScreen(),
    )
  );
}
