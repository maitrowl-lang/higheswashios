import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/constants.dart';
import 'storage_service.dart';
import 'exceptions.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late http.Client _client;
  final StorageService _storageService = StorageService();

  ApiService._internal() {
    _client = http.Client();
  }

  factory ApiService {
    return _instance;
  }

  Future<Map<String, String>> _getHeaders({bool includeAuth = true}) async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (includeAuth) {
      final token = await _storageService.getToken();
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  Future<dynamic> get(String endpoint) async {
    try {
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final headers = await _getHeaders();

      final response = await _client
          .get(uri, headers: headers)
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw _handleException(e);
    }
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final headers = await _getHeaders();

      final response = await _client
          .post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw _handleException(e);
    }
  }

  Future<dynamic> put(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final headers = await _getHeaders();

      final response = await _client
          .put(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw _handleException(e);
    }
  }

  Future<dynamic> patch(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final headers = await _getHeaders();

      final response = await _client
          .patch(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw _handleException(e);
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final headers = await _getHeaders();

      final response = await _client
          .delete(uri, headers: headers)
          .timeout(AppConstants.apiTimeout);

      return _handleResponse(response);
    } catch (e) {
      throw _handleException(e);
    }
  }

  Future<dynamic> upload(String endpoint, String filePath,
      {Map<String, String>? fields}) async {
    try {
      final uri = Uri.parse('${AppConstants.apiBaseUrl}$endpoint');
      final headers = await _getHeaders();

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.files.add(await http.MultipartFile.fromPath('file', filePath));

      if (fields != null) {
        request.fields.addAll(fields);
      }

      final response = await request
          .send()
          .timeout(AppConstants.imageUploadTimeout);
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(responseBody);
      } else {
        throw ApiException(
          message: responseBody,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw _handleException(e);
    }
  }

  dynamic _handleResponse(http.Response response) {
    try {
      final body = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return body;
      } else if (response.statusCode == 401) {
        throw UnauthorizedException('Unauthorized access');
      } else if (response.statusCode == 422) {
        throw ValidationException(
          message: body['message'] ?? 'Validation error',
          errors: Map<String, String>.from(body['errors'] ?? {}),
        );
      } else {
        throw ApiException(
          message: body['message'] ?? 'An error occurred',
          code: body['code'],
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ApiException ||
          e is ValidationException ||
          e is UnauthorizedException) {
        rethrow;
      }
      throw ApiException(
        message: 'Failed to parse response',
        statusCode: response.statusCode,
      );
    }
  }

  Exception _handleException(dynamic e) {
    if (e is TimeoutException) {
      return TimeoutException('Request timeout');
    }
    if (e is ApiException ||
        e is ValidationException ||
        e is UnauthorizedException ||
        e is TimeoutException) {
      return e;
    }
    return NetworkException(e.toString());
  }

  void dispose() {
    _client.close();
  }
}
      return null;
    } catch (e) {
      logger.e('GET Error: $e');
      rethrow;
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    try {
      logger.i('POST: $baseURL$endpoint');
      // Implement HTTP POST request
      return null;
    } catch (e) {
      logger.e('POST Error: $e');
      rethrow;
    }
  }

  Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    try {
      logger.i('PUT: $baseURL$endpoint');
      // Implement HTTP PUT request
      return null;
    } catch (e) {
      logger.e('PUT Error: $e');
      rethrow;
    }
  }

  Future<dynamic> delete(String endpoint) async {
    try {
      logger.i('DELETE: $baseURL$endpoint');
      // Implement HTTP DELETE request
      return null;
    } catch (e) {
      logger.e('DELETE Error: $e');
      rethrow;
    }
  }
}
