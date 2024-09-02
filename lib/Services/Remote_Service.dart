import 'package:http/http.dart' as http;
import 'package:model_api/Model/model.dart';

class Remote_Service {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.org/posts');
    var responce = await client.get(uri);
    if (responce.statusCode == 200) {
      var body = responce.body;
      return postFromJson(body);
    }
  }
}
