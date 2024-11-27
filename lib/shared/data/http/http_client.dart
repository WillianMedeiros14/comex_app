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

  @override
  Future post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    print("body send");
    print(json.encode(body));
    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );

    // Imprimir status code e corpo da resposta para depuração
    print('Response Status: ${response.statusCode}');
    print(
        'Response Body: ${response.body}'); // Aqui mostramos o corpo da resposta

    return response;
  }
}
