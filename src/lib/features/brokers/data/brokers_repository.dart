import '../models/broker.dart';
import '../dto/broker_dto.dart';
import 'brokers_data_provider.dart';

/// Repository converts DTOs to domain models.
class BrokersRepository {
  const BrokersRepository(this._provider);

  final BrokersDataProvider _provider;

  Future<List<Broker>> getBrokers() async {
    final dtos = await _provider.fetchBrokers();
    return dtos.map((e) => e.toModel()).toList();
  }
}
