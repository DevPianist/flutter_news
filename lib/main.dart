import 'package:flutter/material.dart';

import 'pages/noticia_api_page.dart';
// import 'pages/noticia_page.dart';
// import 'pages/noticia_web_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter RSS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => NoticiaApiPage(),
        // 'web': (context) => NoticiaWebPage(),
      },
    );
  }
}
