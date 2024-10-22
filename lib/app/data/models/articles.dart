import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  String status;
  int totalResults;
  List<ArticleElement> articles;

  Article({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<ArticleElement>.from(json["articles"].map((x) => ArticleElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class ArticleElement {
  Source? source; // Nullable source
  String? author; // Nullable author
  String? title;
  String? description;
  String? url;
  String? urlToImage; // Nullable urlToImage
  DateTime? publishedAt;
  String? content;

  ArticleElement({
    this.source, // Source can be null
    this.author, // Author can be null
     this.title,
     this.description,
     this.url,
    this.urlToImage, // URL to image can be null
     this.publishedAt,
     this.content,
  });

  factory ArticleElement.fromJson(Map<String, dynamic> json) => ArticleElement(
    source: json["source"] != null ? Source.fromJson(json["source"]) : null, // Handle null source
    author: json["author"], // Author can be null
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"], // Handle nullable image URL
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source?.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt?.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id; // Nullable id
  String name;

  Source({
    this.id, // ID can be null
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"], // Handle null id
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
