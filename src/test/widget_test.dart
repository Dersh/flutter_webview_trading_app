import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trading_study_webview/features/balance/balance_cubit.dart';
import 'package:trading_study_webview/features/balance/balance_storage.dart';
import 'package:trading_study_webview/features/brokers/screens/brokers_screen.dart';
import 'package:trading_study_webview/features/learning/learn_screen.dart';
import 'package:trading_study_webview/features/shared/balance_view.dart';
import 'package:trading_study_webview/features/trade/trade_screen.dart';

Future<void> _pumpLocalized(WidgetTester tester, Widget child) async {
  await tester.pumpWidget(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: MaterialApp(home: child),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('BalanceView golden', (tester) async {
    await _pumpLocalized(
      tester,
      BlocProvider(
        create: (_) => BalanceCubit(storage: FakeBalanceStorage()),
        child: const BalanceView(),
      ),
    );
    await expectLater(
      find.byType(BalanceView),
      matchesGoldenFile('goldens/balance_view.png'),
    );
  }, skip: true);

  testWidgets('LearnScreen golden', (tester) async {
    await _pumpLocalized(
      tester,
      BlocProvider(
        create: (_) => BalanceCubit(storage: FakeBalanceStorage()),
        child: const LearnScreen(),
      ),
    );
    await expectLater(
      find.byType(LearnScreen),
      matchesGoldenFile('goldens/learn_screen.png'),
    );
  }, skip: true);

  testWidgets('TradeScreen golden', (tester) async {
    await _pumpLocalized(
      tester,
      BlocProvider(
        create: (_) => BalanceCubit(storage: FakeBalanceStorage()),
        child: const TradeScreen(),
      ),
    );
    await expectLater(
      find.byType(TradeScreen),
      matchesGoldenFile('goldens/trade_screen.png'),
    );
  }, skip: true);

  testWidgets('BrokersScreen golden', (tester) async {
    await _pumpLocalized(
      tester,
      BlocProvider(
        create: (_) => BalanceCubit(storage: FakeBalanceStorage()),
        child: const BrokersScreen(),
      ),
    );
    await expectLater(
      find.byType(BrokersScreen),
      matchesGoldenFile('goldens/brokers_screen.png'),
    );
  }, skip: true);
}

/// Simple in-memory implementation for tests.
class FakeBalanceStorage implements BalanceStorage {
  double _amount = 0;

  @override
  Future<double> read() async => _amount;

  @override
  Future<void> save(double value) async => _amount = value;
}
