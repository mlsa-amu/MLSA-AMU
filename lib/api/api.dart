import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  Future fetchContributors() async {
    String url = "https://api.github.com/repos/mlsa-amu/MLSA-AMU/contributors";
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
