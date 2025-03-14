//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

login(String email, String password) async {
  const String baseUrl = 'http://10.0.2.2:8000/api/login'; //localhost
  //const String api = 'login';

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache',
  };

  var url = Uri.parse(baseUrl);
  var body = json.encode({'email': 'admin@admin.com', 'password': 'password'});

  var response = await http.Client().post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    var message = json.decode(response.body);
    if (message['code'].toString() == "200") {
      return jsonDecode(response.body);
    }
  } else {
    // Si la respuesta no es OK, lanza una excepción.
    throw Exception('Failed to login');
  }

  // Si el servidor devuelve una respuesta OK, parsea el JSON
}
