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

app.get("/brokers", (req, res) => {
  const brokers = [{
    "name": "Etoro",
    "url": "https://www.etoro.com",
    "description": "Forex, Stocks, Crypto, CFD, Commodities, CopyTradeTM",
    "trustScore": 4.8,
    "founded": 2007,
    "accounts": "20M+",
    "minDeposit": "Start from $50",
    "badges": [
      "BEST FOR BEGINNERS",
      "WINNER 2022"
    ],
    "warning": "79% Lose with this broker",
    "image": "https://marketing.etorostatic.com/cache1/hp/v_254/images/meta/etoro_logo_social_share.png"
  },
  {
    "name": "Plus500",
    "url": "https://www.plus500.com",
    "description": "CFD, Crypto, Forex, Stocks, Commodities",
    "trustScore": 4.4,
    "founded": 2008,
    "accounts": "288k",
    "minDeposit": "Start from $100",
    "badges": [],
    "warning": "86% Lose with this broker",
    "image": "https://cdn.cookielaw.org/logos/2f494615-359f-450b-8593-ba22d7ef2038/019121a0-c14c-70f5-a0a3-b14f6068f52c/826a263f-1619-4f4e-a818-5e3063560cfe/Plus500-logo-blue.png"
  },
  {
    "name": "AvaTrade",
    "url": "https://www.avatrade.com",
    "description": "Forex, Stocks, Commodities, Cryptos & Stocks",
    "trustScore": 4.4,
    "founded": 2006,
    "accounts": "5M+",
    "minDeposit": "Start from $100",
    "badges": [],
    "warning": "85% Lose with this broker",
    "image": "https://www.avatrade.com/next-images/site-logo-on-light-mob.svg"
  }];
  res.json(brokers);
});


exports.api = functions.https.onRequest(app);
