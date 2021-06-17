library kopo;

export 'src/kopo_model.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kopo/src/kopo_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Kopo extends StatefulWidget {
  static const String PATH = '/kopo';

  final String title;
  final Color colour;
  final String apiKey;
  final Function? callback;
  final PreferredSizeWidget? appBar;

  Kopo({
    Key? key,
    this.title = '주소검색',
    this.colour = Colors.white,
    this.apiKey = '',
    this.appBar,
    this.callback,
  }) : super(key: key);

  @override
  _KopoState createState() => _KopoState();
}

class _KopoState extends State<Kopo> {
  late WebViewController _controller;
  WebViewController get controller => _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          AppBar(
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
                  KopoModel result =
                      KopoModel.fromJson(jsonDecode(message.message));

                  if (widget.callback != null) {
                    widget.callback!(result);
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
