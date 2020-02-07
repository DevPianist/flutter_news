import 'dart:convert';

import 'package:flutter_rss/models/news.dart';
import '../utils/token.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  static Future<List<News>> getNoticias() async {
    const String _clave = Token.newsApi;
    const String _url = 'https://newsapi.org/v2/top-headlines?' + 'language=es';
    final http.Response response = await http.get(
      _url,
      headers: {
        "Authorization": _clave,
      },
    );
    final parsed = jsonDecode(response.body);
    List<News> noticias = [];
    for (int i = 0; i < parsed["articles"].length; i++) {
      News _new = News.fromJson(parsed["articles"][i]);
      noticias.add(_new);
    }
    return noticias;
  }
}
