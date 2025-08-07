import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/balance/balance_cubit.dart';
import 'features/balance/balance_storage.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = BalanceStorage();
    final router = createRouter();

    return EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => BalanceCubit(storage: storage)..load(),
              ),
            ],
            child: MaterialApp.router(
              title: 'Trading App',
              theme: ThemeData(useMaterial3: true),
              routerConfig: router,
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
            ),
          );
        },
      ),
    );
  }
}
