class ApiModel {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ApiModel(
      {this.author,
      this.content,
      this.description,
      this.urlToImage,
      this.publishedAt,
      this.title});

  ApiModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}
