import 'package:http/http.dart' as http;

abstract class ApiService {
  static const String baseUrl = 'https://6ec3-176-240-124-102.ngrok-free.app';

  Future<http.Response> getRequest(String endpoint);
  Future<http.Response> postRequest(String endpoint, Map<String, dynamic> body);
}
