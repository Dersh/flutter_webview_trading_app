import 'package:dio/dio.dart';

import '../dto/broker_dto.dart';

/// Data provider responsible for fetching brokers DTOs from API.
abstract class BrokersDataProvider {
  Future<List<BrokerDto>> fetchBrokers();
}

/// Implementation that loads brokers via [Dio] from REST API.
class HttpBrokersDataProvider implements BrokersDataProvider {
  HttpBrokersDataProvider(this._dio);

  final Dio _dio;

  @override
  Future<List<BrokerDto>> fetchBrokers() async {
    final response = await _dio.get<List<dynamic>>('/api/brokers');
    final data = response.data ?? [];
    return data
        .map((e) => BrokerDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
