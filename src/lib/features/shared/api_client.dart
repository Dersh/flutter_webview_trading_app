import 'package:dio/dio.dart';

/// Base URL for backend API.
const apiBaseUrl = 'https://us-central1-fx-trading-study.cloudfunctions.net';

/// Creates a Dio client configured for the backend.
Dio createApiClient() => Dio(BaseOptions(baseUrl: apiBaseUrl));
