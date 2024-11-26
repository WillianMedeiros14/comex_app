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

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  Future post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );
    return response;
  }
}
