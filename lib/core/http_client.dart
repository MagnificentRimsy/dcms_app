
import 'dart:async';


typedef _ProgressCallback = void Function(int count, int total);

abstract class AppHTTPClient {
  Future<Map<String, dynamic>> get(String url);
 
  Future<Map<String, dynamic>> post(
    String endpoint, {
    required Map<String, dynamic> body,
    _ProgressCallback? onSendProgress,
    _ProgressCallback? onReceiveProgress,
  });

  Future<Map<String, dynamic>> put(
    String endpoint, {
    required Map<String, dynamic> body,
    _ProgressCallback? onSendProgress,
    _ProgressCallback? onReceiveProgress,
  });

  Future<Map<String, dynamic>> patch(
    String endpoint, {
    required Map<String, dynamic> body,
    _ProgressCallback? onSendProgress,
    _ProgressCallback? onReceiveProgress,
  });

  Future<Map<String, dynamic>> delete(
    String endpoint, {
    required Map<String, dynamic> body,
  });

  // Todo: Add that of upload
}
