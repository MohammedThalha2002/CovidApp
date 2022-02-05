import 'dart:convert';
import 'package:http/http.dart';

Future WorldLiveData() async {
  String Url = "https://corona.lmao.ninja/v3/covid-19/all";
  Response response = await get(Uri.parse(Url));
  var body = jsonDecode(response.body);
  print(body);
  return body;
}
