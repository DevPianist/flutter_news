/* import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rss/models/noticia.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NoticiaWebPage extends StatefulWidget {
  @override
  _NoticiaWebPageState createState() => _NoticiaWebPageState();
}

class _NoticiaWebPageState extends State<NoticiaWebPage> {
  Noticia noticia;
  @override
  Widget build(BuildContext context) {
    noticia = ModalRoute.of(context).settings.arguments;
    Completer<WebViewController> _controller = Completer<WebViewController>();

    Widget _web = WebView(
      initialUrl: noticia.link,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        // controller.loadUrl('https://alligator.io/flutter/webview/');
        _controller.complete(controller);
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(noticia.title),
        ),
        body: _web);
  }
}
 */