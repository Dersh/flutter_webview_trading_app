import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/balance_view.dart';
import '../bloc/brokers_cubit.dart';
import '../data/brokers_data_provider.dart';
import '../data/brokers_repository.dart';
import '../widgets/broker_card.dart';
import '../../shared/api_client.dart';

/// Screen that displays available brokers and allows opening them in WebView.
class BrokersScreen extends StatelessWidget {
  BrokersScreen({super.key, BrokersRepository? repository})
      : _repository = repository ??
            BrokersRepository(
              HttpBrokersDataProvider(
                createApiClient(),
              ),
            );

  final BrokersRepository _repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrokersCubit(repository: _repository)..load(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr('nav.brokers')),
          actions: const [BalanceView()],
        ),
        body: BlocBuilder<BrokersCubit, BrokersState>(
          builder: (context, state) {
            if (state is BrokersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BrokersError) {
              return Center(child: Text(state.message));
            } else if (state is BrokersLoaded) {
              return RefreshIndicator(
                onRefresh: () => context.read<BrokersCubit>().load(),
                child: ListView.builder(
                  itemCount: state.brokers.length,
                  itemBuilder: (context, index) {
                    final broker = state.brokers[index];
                    return BrokerCard(broker: broker);
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
