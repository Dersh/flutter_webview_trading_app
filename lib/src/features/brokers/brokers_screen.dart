import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../shared/balance_view.dart';

class BrokersScreen extends StatelessWidget {
  const BrokersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('nav.brokers')),
        actions: const [BalanceView()],
      ),
      body: const Center(
        child: Text('Brokers screen placeholder'),
      ),
    );
  }
}
