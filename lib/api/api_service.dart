import 'dart:convert';
import 'dart:io';

import 'package:giastest/api/base_api_service.dart';
import 'package:giastest/models/api_return_value.dart';
import 'package:http/http.dart' as http;

class ApiService extends BaseApiServices {
  @override
  Future get(String url, {Map<String, String>? headers}) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 10));
      responseJson = returnReponse(response);
    } on SocketException {
      return ApiReturnValue<dynamic>(
        value: null,
        message: "Error: No internet connection",
      );
    }

    return responseJson;
  }

  ApiReturnValue returnReponse(http.Response response) {
    final json = jsonDecode(response.body);
    if (response.statusCode != 200) {
      String message = json["message"] ?? 'Unknown error';
      return ApiReturnValue(
        value: null,
        message: "Error : $message",
      );
    }
    return ApiReturnValue(value: json);
  }
}
