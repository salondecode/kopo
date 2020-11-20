library kopo;

export 'src/kopo_model.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kopo/src/kopo_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Kopo extends StatefulWidget {
  static const String PATH = '/kopo';

  Kopo(
      {Key key,
      this.title = '주소검색',
      this.colour = Colors.white,
      this.apiKey = '',
      this.callback})
      : super(key: key);

  @override
  KopoState createState() => KopoState();

  final String title;
  final Color colour;
  final String apiKey;
  final Function callback;
}

class KopoState extends State<Kopo> {
  WebViewController _controller;
  WebViewController get controller => _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.colour,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData().copyWith(color: Colors.black),
      ),
      body: WebView(
          initialUrl: 'https://salondecode.github.io/kopo/assets/daum.html',
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: Set.from([
            JavascriptChannel(
                name: 'onComplete',
                onMessageReceived: (JavascriptMessage message) {
                  //This is where you receive message from
                  //javascript code and handle in Flutter/Dart
                  //like here, the message is just being printed
                  //in Run/LogCat window of android studio
                  const result =
                      KopoModel.fromJson(jsonDecode(message.message));

                  if (widget.callback != null) {
                    widget.callback(result);
                  }

                  Navigator.pop(context, result);
                }),
          ]),
          onWebViewCreated: (WebViewController webViewController) async {
            _controller = webViewController;
          }),
    );
  }
}
