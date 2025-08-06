const functions = require("firebase-functions");
const express = require("express");
const app = express();

app.get("/articles", (req, res) => {
  res.json([{
    "alias": "why-trade-forex",
    "title": "Зачем торговать на Forex?",
    "reward": "Collect $200",
    "url": "/why-trade-forex.html"
  },
  {
    "alias": "how-much-can-you-make",
    "title": "Сколько можно заработать на трейдинге?",
    "reward": "Collect $100",
    "url": "/how-much-can-you-make.html"
  },
  {
    "alias": "when-to-trade-forex",
    "title": "Когда лучше торговать на Forex?",
    "reward": "Collect $100",
    "url": "/when-to-trade-forex.html"
  },
  {
    "alias": "forex-basics",
    "title": "Основы торговли на Forex",
    "reward": "Collect $200",
    "url": "/forex-basics.html"
  },
  {
    "alias": "social-trading",
    "title": "Что такое социальный трейдинг?",
    "reward": "Collect $200",
    "url": "/social-trading.html"
  },
  {
    "alias": "smart-portfolios",
    "title": "Умные портфели: как диверсифицировать риски",
    "reward": "Collect $100",
    "url": "/smart-portfolios.html"
  }]);
});

exports.api = functions.https.onRequest(app);
