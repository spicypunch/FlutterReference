import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:permission_handler/permission_handler.dart';

import 'initialize_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await requestPermissions();
  await initializeService();
  runApp(MaterialApp(home: MyApp()));
}

Future<void> requestPermissions() async {
  await Permission.location.request();
  await Permission.notification.request();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    final service = FlutterBackgroundService();
    final isRunning = await service.isRunning();
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      if (!isRunning) {
        startBackgroundService();
      }
    } else if (state == AppLifecycleState.resumed) {
      if (isRunning) {
        stopBackgroundService();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Button'),
              onPressed: () async {
                final service = FlutterBackgroundService();
                var isRunning = await service.isRunning();
                if (isRunning) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('1')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('2')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
