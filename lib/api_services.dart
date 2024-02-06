import 'dart:convert';

import 'package:apicall_with_model2/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ApiServices {
  Future<List<ApiModel>?> getApiData() async {
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<ApiModel> model = List<ApiModel>.from(
            json.decode(response.body).map((x) => ApiModel.fromJson(x)));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}
