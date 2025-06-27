class BodyItemModel {
  final String imageAdd;
  final String title;
  final String description;
  final String url;

  BodyItemModel({
    required this.imageAdd,
    required this.title,
    required this.description,
    required this.url,
  });

  factory BodyItemModel.fromJson(json) {
    return BodyItemModel(
      imageAdd: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
