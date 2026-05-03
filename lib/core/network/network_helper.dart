import 'dart:developer';
import 'package:dio/dio.dart';
import 'dio_client.dart';

class NetworkHelper {
  final Dio _dio;

  NetworkHelper({Dio? dio}) : _dio = dio ?? DioClient().dio;

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters, Options? options}) async {
    return _request(() => _dio.get(path, queryParameters: queryParameters, options: options));
  }

  Future<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    return _request(() => _dio.post(path, data: data, queryParameters: queryParameters, options: options));
  }

  Future<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options}) async {
    return _request(() => _dio.delete(path, data: data, queryParameters: queryParameters, options: options));
  }

  Future<Response> _request(Future<Response> Function() request) async {
    try {
      final response = await request();
      _logResponse(response);
      return response;
    } on DioException catch (e, stack) {
      _logError(e, stack);
      throw _handleDioError(e);
    } catch (e, stack) {
      log('Unexpected Error', error: e, stackTrace: stack);
      throw Exception('An unexpected error occurred: $e');
    }
  }

  void _logResponse(Response response) {
    log('--- API Response ---');
    log('Path: ${response.requestOptions.path}');
    log('Status Code: ${response.statusCode}');
    log('Data: ${response.data}');
    log('--------------------');
  }

  void _logError(DioException e, StackTrace stack) {
    log('--- API Error ---');
    log('Path: ${e.requestOptions.path}');
    log('Error: ${e.message}');
    log('Type: ${e.type}');
    if (e.response != null) {
      log('Status Code: ${e.response?.statusCode}');
      log('Response Data: ${e.response?.data}');
    }
    log('Stack Trace: $stack');
    log('-----------------');
  }

  Exception _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('Connection timed out. Please check your internet.');
      case DioExceptionType.badResponse:
        final message = e.response?.data?['message'] ?? 'Server error: ${e.response?.statusCode}';
        return Exception(message);
      case DioExceptionType.cancel:
        return Exception('Request was cancelled.');
      case DioExceptionType.connectionError:
        return Exception('No internet connection.');
      default:
        return Exception('Network error: ${e.message}');
    }
  }
}
