/// Domain model for a broker platform.
class Broker {
  Broker({
    required this.name,
    required this.url,
    required this.description,
    required this.trustScore,
    required this.founded,
    required this.accounts,
    required this.minDeposit,
    required this.badges,
    required this.warning,
    required this.image,
  });

  final String name;
  final String url;
  final String description;
  final double trustScore;
  final int founded;
  final String accounts;
  final String minDeposit;
  final List<String> badges;
  final String warning;
  final String image;
}
