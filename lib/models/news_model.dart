class NewsModel {
  // final String id;
  final String category;
  final String title;
  final String imageUrl;
  final String subtitle;
  final String body;

  NewsModel({
    // required this.id,
    required this.category,
    required this.title,
    required this.imageUrl,
    required this.subtitle,
    required this.body,
  });

  toJson() => {
        // 'id': id,
        'category': category,
        'title': title,
        'imageUrl': imageUrl,
        'subtitle': subtitle,
        'body': body,
      };

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      category: map['category'],
      title: map['title'],
      imageUrl: map['imageUrl'],
      subtitle: map['subtitle'],
      body: map['body'],
    );
  }
}
