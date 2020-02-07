/* import 'package:flutter/material.dart';
import 'package:flutter_rss/models/noticia.dart';
import '../rss/comercio_rss.dart';

class NoticiaPage extends StatefulWidget {
  @override
  _NoticiaPageState createState() => _NoticiaPageState();
}

class _NoticiaPageState extends State<NoticiaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSS COMERCIO DEMO'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: ComercioRss.getNoticias(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<Noticia> noticias = snapshot.data;
            return (snapshot.data != null)
                ? Container(
                    child: ListView.builder(
                      itemCount: noticias.length,
                      itemBuilder: (BuildContext context, int i) {
                        Noticia noticia = noticias[i];
                        return ListTile(
                          trailing: Icon(Icons.arrow_forward_ios),
                          leading: CircleAvatar(
                            child: Icon(Icons.star),
                          ),
                          title: Text(
                            noticia.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(noticia.pubDate),
                          onTap: () {
                            Navigator.pushNamed(context, 'web',
                                arguments: noticia);
                          },
                        );
                      },
                    ),
                  )
                : CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
 */