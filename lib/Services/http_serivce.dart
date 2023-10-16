import 'dart:convert';
import 'dart:io';

import 'package:flutter_application_2/Services/apiService.dart';
import 'package:http/http.dart' as http;

class HttpService implements ApiService {
  HttpClient client = HttpClient()
    ..badCertificateCallback = (X509Certificate cert, String host, int port) {
      return true;
    };
  @override
  Future<http.Response> getRequest(String endpoint) async {
    try {
      final url = Uri.parse(ApiService.baseUrl + endpoint);
      final response = await http.get(url);
      print("status Code: ${response.statusCode}");
      print("respınsebody : ${response.body}");
      return response;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<http.Response> postRequest(
      String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('${ApiService.baseUrl}$endpoint');
    try {
      final response = await http.post(url,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
      return response;
    } catch (e) {
      throw e;
    }
  }
}
