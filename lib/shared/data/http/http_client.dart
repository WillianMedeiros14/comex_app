import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});

  Future post({
    required String url,
    required Map<String, dynamic> body,
  });
}

class HttpClient implements IHttpClient {
  final client = http.Client();
  final String baseUrl = 'http://192.168.51.106:8082/api';

  @override
  Future get({required String url}) async {
    final endpoint = Uri.parse('$baseUrl/$url');
    return await client.get(endpoint);
  }

  @override
  Future post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final endpoint = Uri.parse('$baseUrl/$url');
    final response = await client.post(
      endpoint,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    return response;
  }
}
