import 'package:flutter_webapi_first_course/services/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

class JournalService {
  static const String url = "http://192.168.15.82:3000/";
  static const String resource = "learn/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  getUrl() {
    return "$url$resource";
  }

  register(String content) {
    client.post(Uri.parse(getUrl()), body: {"content": content});
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    return response.body;
  }
}
