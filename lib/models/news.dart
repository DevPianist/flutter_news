class News {
  final String title,
      description,
      publishedAt,
      url,
      urlToImage,
      content,
      author;

  News({
    this.title,
    this.description,
    this.publishedAt,
    this.url,
    this.urlToImage,
    this.content,
    this.author,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? 'Nueva noticia',
      description: (json['description'] != "")
          ? json['description']
          : 'Visita la pagina para mas informacion',
      publishedAt: json['publishedAt'] ?? 'No definido',
      url: json['url'] ?? 'https://www.google.com.pe',
      urlToImage: (json['urlToImage'].toString().substring(0, 2) == "//")
          ? 'https://${json['urlToImage'].toString().substring(2)}'
          : json['urlToImage'],
      content: json['content'] ?? 'Visita la pagina para mas informacion',
      author: json['author'] ?? 'Anonimo',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "description": this.description,
      "publishedAt": this.publishedAt,
      "url": this.url,
      "urlToImage": this.urlToImage,
      "content": this.content,
      "author": this.author,
    };
  }
}
