import 'dart:convert';
import 'dart:io';

void main() {
  final brokers = [
    {
      "name": "Etoro",
      "url": "https://www.etoro.com",
      "description": "Forex, Stocks, Crypto, CFD, Commodities, CopyTradeTM",
      "trustScore": 4.8,
      "founded": 2007,
      "accounts": "20M+",
      "minDeposit": "Start from \$50",
      "badges": ["BEST FOR BEGINNERS", "WINNER 2022"],
      "warning": "79% Lose with this broker",
      "image": "https://seeklogo.com/images/E/etoro-logo-0E5B0C3E1A-seeklogo.com.png"
    },
    {
      "name": "Plus500",
      "url": "https://www.plus500.com",
      "description": "CFD, Crypto, Forex, Stocks, Commodities",
      "trustScore": 4.4,
      "founded": 2008,
      "accounts": "288k",
      "minDeposit": "Start from \$100",
      "badges": [],
      "warning": "86% Lose with this broker",
      "image": "https://upload.wikimedia.org/wikipedia/commons/3/39/Plus500-Logo.png"
    },
    {
      "name": "AvaTrade",
      "url": "https://www.avatrade.com",
      "description": "Forex, Stocks, Commodities, Cryptos & Stocks",
      "trustScore": 4.4,
      "founded": 2006,
      "accounts": "5M+",
      "minDeposit": "Start from \$100",
      "badges": [],
      "warning": "85% Lose with this broker",
      "image": "https://upload.wikimedia.org/wikipedia/commons/2/28/AvaTrade.png"
    }
  ];

  final file = File('firebase/functions/index.js');
  if (!file.existsSync()) {
    print('❌ index.js not found in firebase/functions.');
    return;
  }

  var content = file.readAsStringSync();

  // Добавляет новую функцию `getBrokers` если её нет
  final insert = '''
app.get("/brokers", (req, res) => {
  const brokers = ${jsonEncode(brokers)};
  res.json(brokers);
});
''';

  if (content.contains('/brokers')) {
    print('ℹ️ Route /brokers уже существует, ничего не изменено.');
  } else {
    final updated = content.replaceFirst(RegExp(r'exports\.api\s*=\s*functions\.https\.onRequest\(app\);'),
        '$insert\n\nexports.api = functions.https.onRequest(app);');
    file.writeAsStringSync(updated);
    print('✅ Route /brokers добавлен в index.js');
  }
}
