import 'package:http/http.dart' as http;

abstract class ApiService {
  static const String baseUrl = 'https://af4d-5-176-136-24.ngrok-free.app';

  Future<http.Response> getRequest(String endpoint);
  Future<http.Response> postRequest(String endpoint, Map<String, dynamic> body);
}
