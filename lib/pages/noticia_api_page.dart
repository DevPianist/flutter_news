import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rss/api/newsapi.dart';
import 'package:flutter_rss/models/news.dart';

class NoticiaApiPage extends StatefulWidget {
  @override
  _NoticiaApiPageState createState() => _NoticiaApiPageState();
}

class _NoticiaApiPageState extends State<NoticiaApiPage> {
  _imagen(String urlToImage) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      filterQuality: FilterQuality.medium,
      imageUrl: urlToImage,
      placeholder: (context, url) => CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => CachedNetworkImage(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTqjsMU9OsHgdQUf7iop0kjwUxlupdzRd7pj1SrBzmU1fWp_wlg',
      ),
    );
  }

  _imagenPrincipal(String urlToImage, Size size) {
    return CachedNetworkImage(
      color: Color.fromRGBO(170, 170, 170, 1),
      colorBlendMode: BlendMode.modulate,
      fit: BoxFit.cover,
      width: size.width,
      height: size.height * 0.25,
      filterQuality: FilterQuality.medium,
      imageUrl: urlToImage,
      placeholder: (context, url) => CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => CachedNetworkImage(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTqjsMU9OsHgdQUf7iop0kjwUxlupdzRd7pj1SrBzmU1fWp_wlg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        toolbarOpacity: 0.0,
        centerTitle: false,
        title: Container(
          margin: const EdgeInsets.only(left: 14.0),
          child: Text(
            'News',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 30.0),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: NewsApi.getNoticias(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<News> noticias = [];
            if (snapshot.data != null) noticias = snapshot.data;
            if (snapshot.hasError) print(snapshot.error);
            return (snapshot.data != null)
                ? SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: size.height * 0.25,
                          padding: const EdgeInsets.only(left: 28.0),
                          margin:
                              const EdgeInsets.only(bottom: 25.0, top: 15.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 4,
                                blurRadius: 10,
                                offset: Offset(40, 10),
                              )
                            ],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                right: 0.0,
                                child: _imagenPrincipal(
                                    noticias[0].urlToImage, size),
                              ),
                              Positioned(
                                bottom: 15.0,
                                left: 5.0,
                                right: 50.0,
                                child: ListTile(
                                  title: Text(
                                    noticias[0].title,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  subtitle: Text(
                                    noticias[0].author,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: noticias.length - 1,
                          itemBuilder: (BuildContext context, int i) {
                            News noticia = noticias[i + 1];
                            return ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 13.0),
                              trailing: Container(
                                width: 85,
                                // height: size.height * 0.3,
                                child: _imagen(noticia.urlToImage),
                              ),
                              title: Text(
                                noticia.title,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(noticia.author),
                              ),
                              onTap: () {
                                print(noticia.title);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
