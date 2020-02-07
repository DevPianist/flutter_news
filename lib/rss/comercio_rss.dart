// import 'dart:async';
// import 'package:flutter_rss/models/noticia.dart';
// import 'package:http/http.dart' as http;
// import 'package:webfeed/webfeed.dart';

// class ComercioRss {
//   static Future<List<Noticia>> getNoticias() async {
//     http.Response data = await http
//         .get("https://elcomercio.pe/feeds/?outputType=fb-instant-article");

//     var rssFeed = new RssFeed.parse(data.body.toString());
//     // var rssFeed = new AtomFeed.parse(data.body.toString());

//     List<Noticia> noticias = new List();
//     print(rssFeed.items.length);
//     for (int i = 0; i < 10 /* rssFeed.items.length */; i++) {
//       noticias.add(
//         new Noticia(
//           title: rssFeed.items[i].title.trim(),
//           description: rssFeed.items[i].author.trim(),
//           pubDate: rssFeed.items[i].pubDate.substring(0, 10),
//           link: rssFeed.items[i].link,
//         ),
//       );
//     }
//     return noticias;
//   }
// }
