import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../shared/balance_view.dart';
import 'forex_quote.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  late Future<List<ForexQuote>> _future;
  final _dio = Dio();

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<List<ForexQuote>> _load() async {
    final response = await _dio.get<Map<String, dynamic>>(
      'https://fcsapi.com/api-v3/forex/latest',
      queryParameters: {
        'symbol': 'all_forex',
        'access_key': 'MMYvxViGmOGIrdFgXXXX6fSAeZiOJGng',
      },
    );
    final data = response.data?['response'] as List<dynamic>? ?? [];
    return data
        .map((e) => ForexQuote.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('nav.trade')),
        actions: const [BalanceView()],
      ),
      body: FutureBuilder<List<ForexQuote>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          final quotes = snapshot.data?.take(10).toList() ?? [];
          return Padding(
            padding: const EdgeInsets.all(16),
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      for (var i = 0; i < quotes.length; i++)
                        FlSpot(i.toDouble(), quotes[i].price),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
