import 'dart:convert';

import 'package:http/http.dart' as http;

class WebService {
  Future<List<String>> fetchProductsList() async {
    final url = Uri.parse("http://35.154.26.203/product-ids");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List body = jsonDecode(response.body);
      return body.cast<String>();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
