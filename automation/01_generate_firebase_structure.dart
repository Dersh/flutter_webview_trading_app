import 'dart:convert';
import 'dart:io';

void main() async {
  final firebaseDir = Directory('firebase');
  if (firebaseDir.existsSync()) firebaseDir.deleteSync(recursive: true);
  firebaseDir.createSync();

  // Создаём папки
  final publicDir = Directory('firebase/public');
  final functionsDir = Directory('firebase/functions');
  publicDir.createSync(recursive: true);
  functionsDir.createSync(recursive: true);

  // Примерный список статей
  final articles = [
    {
      "alias": "why-trade-forex",
      "title": "Зачем торговать на Forex?",
      "reward": "Collect \$200",
      "url": "/why-trade-forex.html"
    },
    {
      "alias": "how-much-can-you-make",
      "title": "Сколько можно заработать на трейдинге?",
      "reward": "Collect \$100",
      "url": "/how-much-can-you-make.html"
    },
    {
      "alias": "when-to-trade-forex",
      "title": "Когда лучше торговать на Forex?",
      "reward": "Collect \$100",
      "url": "/when-to-trade-forex.html"
    },
    {
      "alias": "forex-basics",
      "title": "Основы торговли на Forex",
      "reward": "Collect \$200",
      "url": "/forex-basics.html"
    },
    {
      "alias": "social-trading",
      "title": "Что такое социальный трейдинг?",
      "reward": "Collect \$200",
      "url": "/social-trading.html"
    },
    {
      "alias": "smart-portfolios",
      "title": "Умные портфели: как диверсифицировать риски",
      "reward": "Collect \$100",
      "url": "/smart-portfolios.html"
    }
  ];

  // index.js (Cloud Function)
  final indexJs = '''
const functions = require("firebase-functions");
const express = require("express");
const app = express();

app.get("/articles", (req, res) => {
  res.json(${jsonEncode(articles)});
});

exports.api = functions.https.onRequest(app);
''';
  File('firebase/functions/index.js').writeAsStringSync(indexJs);

  // package.json (для node)
  File('firebase/functions/package.json').writeAsStringSync('''
{
  "name": "functions",
  "engines": { "node": "18" },
  "dependencies": {
    "express": "^4.18.2",
    "firebase-functions": "^4.4.1"
  }
}
''');

  // firebase.json
  File('firebase/firebase.json').writeAsStringSync('''
{
  "hosting": {
    "public": "public",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "/articles",
        "function": "api"
      }
    ]
  }
}
''');

  print('✅ Firebase структура создана в ./firebase/');
}
