import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BalanceStorage {
  static const _key = 'balance';
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<double> read() async {
    final value = await _storage.read(key: _key);
    return double.tryParse(value ?? '') ?? 0.0;
  }

  Future<void> save(double amount) async {
    await _storage.write(key: _key, value: amount.toString());
  }
}
