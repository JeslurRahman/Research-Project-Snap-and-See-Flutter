import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static callFlaskAPI(String query) async {
    try {
      var response = await http.get(
          Uri.parse('https://assistantserver.azurewebsites.net/home/$query'));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print(
            "Failed to fetch data from Flask API. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        return null;
      }
    } catch (err) {
      print("Error: $err");
      return null;
    }
  }
}
