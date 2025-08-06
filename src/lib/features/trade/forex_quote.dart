class ForexQuote {
  ForexQuote({required this.symbol, required this.price});

  final String symbol;
  final double price;

  factory ForexQuote.fromJson(Map<String, dynamic> json) => ForexQuote(
        symbol: json['s'] as String,
        price: double.parse(json['c'] as String),
      );
}
