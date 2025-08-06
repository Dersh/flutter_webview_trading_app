class Article {
  Article({required this.id, required this.title, required this.reward, required this.content});

  final String id;
  final String title;
  final double reward;
  final String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json['id'] as String,
        title: json['title'] as String,
        reward: (json['reward'] as num).toDouble(),
        content: json['content'] as String,
      );
}
