import 'package:http/http.dart' as http;

class Request {
  dynamic getUrl = [
    'https://e621.net/posts.json?tags=&limit=10&page=1',
  ];

  // Get request
  Future<http.Response> get(int source) async {
    var respond = http
        .get(Uri.parse(getUrl[source]))
        .timeout(const Duration(seconds: 10))
        .catchError((e) {
      throw Exception('Error: Take too long to get server \n$e');
    });
    return await respond;
  }
}
