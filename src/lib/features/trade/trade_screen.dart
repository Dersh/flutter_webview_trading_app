import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../shared/balance_view.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('nav.trade')),
        actions: const [BalanceView()],
      ),
      body: const Center(
        child: Text('Trading screen placeholder'),
      ),
    );
  }
}
