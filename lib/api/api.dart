import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mlsa_amu/api/api_url.dart';

class API {
  Future fetchRepoDetails() async {
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
      };

      var response = await http.get(
        Uri.parse(ApiUrl.repoDetailApi),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
      return null;
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }

  Future fetchUsersDetails(String url) async {
    try {
      Map<String, String> headers = {
        "Content-type": "application/json",
      };

      var response = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      }
      return null;
    } catch (e) {
      print("ERROR: $e");
      return null;
    }
  }
}
