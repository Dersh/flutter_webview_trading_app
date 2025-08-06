import 'package:flutter_bloc/flutter_bloc.dart';

import 'balance_storage.dart';

class BalanceCubit extends Cubit<double> {
  BalanceCubit({required this.storage}) : super(0);

  final BalanceStorage storage;

  Future<void> load() async {
    final value = await storage.read();
    emit(value);
  }

  Future<void> add(double amount) async {
    final newValue = state + amount;
    emit(newValue);
    await storage.save(newValue);
  }

  Future<void> reset() async {
    emit(0);
    await storage.save(0);
  }
}
