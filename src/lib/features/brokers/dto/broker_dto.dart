import '../models/broker.dart';

/// DTO for a broker returned by the API or assets.
class BrokerDto {
  BrokerDto({
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

  factory BrokerDto.fromJson(Map<String, dynamic> json) => BrokerDto(
        name: json['name'] as String,
        url: json['url'] as String,
        description: json['description'] as String,
        trustScore: (json['trustScore'] as num).toDouble(),
        founded: json['founded'] as int,
        accounts: json['accounts'] as String,
        minDeposit: json['minDeposit'] as String,
        badges: (json['badges'] as List<dynamic>).cast<String>(),
        warning: json['warning'] as String,
        image: json['image'] as String,
      );

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

  /// Converts DTO to domain model.
  Broker toModel() => Broker(
        name: name,
        url: url,
        description: description,
        trustScore: trustScore,
        founded: founded,
        accounts: accounts,
        minDeposit: minDeposit,
        badges: badges,
        warning: warning,
        image: image,
      );
}
