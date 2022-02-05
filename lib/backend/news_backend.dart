import 'dart:convert';
import 'package:http/http.dart';

Future<List> CovidNewsData() async {
  var apikey = "b0b11dc4b521483ebd8ea525fcac52cd";
  String Url =
      "https://newsapi.org/v2/everything?q=covid&sortBy=popularity&apiKey=b0b11dc4b521483ebd8ea525fcac52cd";
  Response response = await get(Uri.parse(Url));
  var body = jsonDecode(response.body);
  // print(body);
  return body['articles'];
}
