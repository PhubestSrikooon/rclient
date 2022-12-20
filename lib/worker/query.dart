import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:rclient/notifier.dart';

class Request {
  dynamic getUrl = [
    {
      'url': 'https://e621.net/posts.json?',
      'query': {
        'pageid': 'page',
        'limit': 'limit',
        'tags': 'tags',
      },
      'posts': 'posts',
    },
    {
      'url': 'https://api.rule34.xxx/index.php?page=dapi&s=post&q=index&',
      'query': {
        'pageid': 'pid',
        'limit': 'limit',
        'tags': 'tags',
      },
      'posts': null,
    }
  ];

  StaticNotifier staticNotifier = StaticNotifier();

  // Get request
  Future<http.Response> get(String uri) async {
    var respond = http
        .get(Uri.parse(uri))
        .timeout(const Duration(seconds: 20))
        .catchError((e) {
      throw Exception('$e');
    });
    return await respond;
  }

  Future<dynamic> getFromSource(int source, String tags) async {
    var body = null;
    if (source == 0) {
      return await get(getUrl[source]['url'] +
              getUrl[source]['query']['tags'] +
              '=' +
              tags.replaceAll(' ', '+') +
              '&' +
              getUrl[source]['query']['limit'] +
              '=100')
          .then((value) => jsonDecode(value.body)['posts']);
    } else if (source == 1) {
      return await get(getUrl[source]['url'] +
              getUrl[source]['query']['tags'] +
              '=' +
              tags.replaceAll(' ', '+') +
              '&' +
              getUrl[source]['query']['limit'] +
              '=100')
          .then((value) => jsonDecode(value.body));
    } else {
      return await get(getUrl[source]['url'] +
          getUrl[source]['query']['tags'] +
          '=' +
          tags.replaceAll(' ', '+') +
          '&' +
          getUrl[source]['query']['limit'] +
          '=100');
    }
  }
}
