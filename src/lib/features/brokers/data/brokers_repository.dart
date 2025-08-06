import 'dart:convert';

import 'package:flutter/services.dart';

import '../dto/broker_dto.dart';
import '../models/broker.dart';

/// Repository responsible for loading brokers list.
class BrokersRepository {
  const BrokersRepository();

  Future<List<Broker>> loadBrokers() async {
    final data = await rootBundle.loadString('assets/brokers.json');
    final list = json.decode(data) as List<dynamic>;
    return list
        .map((e) => BrokerDto.fromJson(e as Map<String, dynamic>).toModel())
        .toList();
  }
}
