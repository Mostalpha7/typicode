import 'dart:io';
import 'package:homefort/commons/string_defination.dart';
import 'package:http/http.dart';
import 'errors.dart';

class HttpRequest {
  Future<Response> getMethod(String path, String params) async {
    Future<Response> response =
        get(Uri.parse(ConstantStringDefinations.baseUrl + path + params));

    return (await _checkAuthorization(response: response)) as Response;
  }

  Future<BaseResponse> _checkAuthorization(
      {required Future<BaseResponse> response}) {
    return response.onError((err, stack) {
      if (err is SocketException) {
        throw new InternetConnectionError();
      }
      return Future.error(err!);
    }).then((BaseResponse value) {
      return value;
    });
  }
}
