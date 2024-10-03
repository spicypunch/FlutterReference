import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

void main() {
  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final WebSocketChannel _channel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    // TODO: implement dispose
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    connect();
                  },
                  child: Text('Connect')),
              ElevatedButton(
                  onPressed: () {
                    final str = '''
                  {
                    "type" : "2",
                    "presentLat" : "1.2",
                    "presentLng" : "1.2",
                    "destinationDistance" : "500"
                  }
                ''';

                    _channel.sink.add(str);
                  },
                  child: Text('Send')),
            ],
          ),
        ),
      ),
    );
  }

  void connect() async {
    final wsUrl = Uri.parse(
        'ws://ec2-3-34-255-150.ap-northeast-2.compute.amazonaws.com:8080/location/share');
    _channel = IOWebSocketChannel.connect(
      wsUrl,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJpZGVudGl0eSI6IjAxMDI4MzMxMzQ3IiwibWVtYmVyU2VxIjoyLCJpYXQiOjE3MjQzMzA1MjEsImV4cCI6MTcyNDMzMjMyMX0.ZN4xc3Rcgfu_kcWFPHYi_Ql49XBE_-NijywlDmzdJBI'
      },
    );

    await _channel.ready;

    print(_channel.closeCode.toString());
    print(_channel.closeReason);

    // _channel.sink.add('테스트 테스트 제발!!!!');

    _channel.stream.listen((message) {
      print("message: $message");
    });
  }
}
