import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/learning/learn_screen.dart';
import 'features/learning/article_detail_page.dart';
import 'features/learning/article.dart';
import 'features/trade/trade_screen.dart';
import 'features/brokers/screens/brokers_screen.dart';
import 'features/shared/home_shell.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/learn',
    routes: [
      ShellRoute(
        builder: (context, state, child) => HomeShell(child: child),
        routes: [
          GoRoute(
            path: '/learn',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: LearnScreen()),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) {
                  final article = state.extra as Article?;
                  if (article == null) {
                    return const Scaffold(
                        body: Center(child: Text('Not found')));
                  }
                  return ArticleDetailPage(article: article);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/trade',
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TradeScreen()),
          ),
          GoRoute(
            path: '/brokers',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: BrokersScreen()),
          ),
        ],
      ),
    ],
  );
}
