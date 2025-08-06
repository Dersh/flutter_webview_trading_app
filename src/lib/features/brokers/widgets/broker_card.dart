import 'package:flutter/material.dart';

import '../../shared/webview_page.dart';
import '../models/broker.dart';

/// Visual card widget that shows broker information and opens WebView on tap.
class BrokerCard extends StatelessWidget {
  const BrokerCard({super.key, required this.broker});

  final Broker broker;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(broker.image, width: 48, height: 48),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    broker.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(broker.description),
            const SizedBox(height: 8),
            Wrap(
              spacing: 4,
              children: broker.badges.map((e) => Chip(label: Text(e))).toList(),
            ),
            const SizedBox(height: 8),
            Text('Trust score: ${broker.trustScore}'),
            Text('Founded: ${broker.founded}'),
            Text('Accounts: ${broker.accounts}'),
            Text('Min deposit: ${broker.minDeposit}'),
            const SizedBox(height: 8),
            if (broker.warning.isNotEmpty)
              Text(
                broker.warning,
                style: const TextStyle(color: Colors.red),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => WebViewPage(url: broker.url),
                    ),
                  );
                },
                child: const Text('Visit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
