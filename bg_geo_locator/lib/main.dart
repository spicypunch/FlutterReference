import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  runApp(MyApp());
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case 'fetchLocation':
        await _fetchLocation();
        break;
    }
    return Future.value(true);
  });
}

Future<void> _fetchLocation() async {
  final position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );
  print("현재 위치: ${position.latitude}, ${position.longitude}");
  // 여기에서 위치 데이터를 저장하거나 서버로 전송하는 로직을 추가할 수 있습니다.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Background Location Tracker')),
        body: Center(
          child: ElevatedButton(
            child: Text('Start Background Location Tracking'),
            onPressed: () {
              Workmanager().registerPeriodicTask(
                "1",
                "fetchLocation",
                frequency: Duration(minutes: 15),
              );
            },
          ),
        ),
      ),
    );
  }
}