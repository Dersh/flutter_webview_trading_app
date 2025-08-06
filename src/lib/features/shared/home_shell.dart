import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShell extends StatelessWidget {
  const HomeShell({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    int index = 0;
    if (location.startsWith('/trade')) {
      index = 1;
    } else if (location.startsWith('/brokers')) {
      index = 2;
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) {
          switch (i) {
            case 0:
              context.go('/learn');
              break;
            case 1:
              context.go('/trade');
              break;
            case 2:
              context.go('/brokers');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.school), label: tr('nav.learn')),
          BottomNavigationBarItem(icon: const Icon(Icons.show_chart), label: tr('nav.trade')),
          BottomNavigationBarItem(icon: const Icon(Icons.account_balance), label: tr('nav.brokers')),
        ],
      ),
    );
  }
}
