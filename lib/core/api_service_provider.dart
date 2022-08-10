import 'dart:convert';

import 'package:dcms_app/routes/base.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiServiceProvider extends GetConnect {
  Future<Response> sendPost(String url, Map data) {
    Map<String, String> headers = {
      "Accept": "application/json",
    };

    return post(
      BaseEndpoint.baseUrl + url,
      data,
      headers: headers,
      contentType: 'application/json; charset=UTF-8',
    );
  }

}
