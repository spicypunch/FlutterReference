import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final url = Uri.parse('https://velog.io/@godmin66');

class HomeScreen extends StatelessWidget {
  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(url);

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Maru'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.loadRequest(url);
              },
              icon: Icon(
                Icons.home,
              ))
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
      // WebView(
      //   onWebViewCreated: (WebViewController controller) {
      //     this.controller = controller;
      //   },
      //   initialUrl: url,
      //   javascriptMode: JavascriptMode.unrestricted,
      // ),
    );
  }
}
