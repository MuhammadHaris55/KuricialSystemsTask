import 'dart:convert';

import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

//POST API FUNCTION
  static Future checkString(var word) async {
    var url = 'http://192.168.20.29';

    Map data = {
      'word': word,
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await client.post(
        Uri.parse('$url/palindromeApi/public/api/checkString'),
        headers: {"Content-Type": "application/json"},
        body: body);

    print(response);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return jsonString;
    } else {
      print("error");
      //show error message
      return jsonDecode(response.body);
    }
  }
}
