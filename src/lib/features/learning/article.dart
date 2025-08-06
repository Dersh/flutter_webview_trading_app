class Article {
  Article({required this.id, required this.title, required this.reward, required this.url});

  final String id;
  final String title;
  final double reward;
  final String url;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json['alias'] as String,
        title: json['title'] as String,
        reward: _parseReward(json['reward'] as String),
        url: json['url'] as String,
      );

  static double _parseReward(String reward) {
    final match = RegExp(r'(\d+(\.\d+)?)').firstMatch(reward);
    return match != null ? double.parse(match.group(0)!) : 0;
  }
}
