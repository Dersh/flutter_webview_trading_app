import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/brokers_repository.dart';
import '../models/broker.dart';

/// State for [BrokersCubit].
abstract class BrokersState {
  const BrokersState();
}

class BrokersLoading extends BrokersState {
  const BrokersLoading();
}

class BrokersLoaded extends BrokersState {
  const BrokersLoaded(this.brokers);
  final List<Broker> brokers;
}

class BrokersError extends BrokersState {
  const BrokersError(this.message);
  final String message;
}

/// Cubit responsible for loading brokers.
class BrokersCubit extends Cubit<BrokersState> {
  BrokersCubit({required BrokersRepository repository})
      : _repository = repository,
        super(const BrokersLoading());

  final BrokersRepository _repository;

  Future<void> load() async {
    try {
      emit(const BrokersLoading());
      final brokers = await _repository.getBrokers();
      emit(BrokersLoaded(brokers));
    } catch (e) {
      emit(BrokersError(e.toString()));
    }
  }
}
