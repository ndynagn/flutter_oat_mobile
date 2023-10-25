import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_oat_mobile/src/network/api_client/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_providers.g.dart';

@riverpod
String baseUrl(BaseUrlRef ref) {
  return dotenv.env['API_BASE_URL']!;
}

@riverpod
ApiClient apiClient(ApiClientRef ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  return ApiClient(baseUrl: baseUrl);
}
