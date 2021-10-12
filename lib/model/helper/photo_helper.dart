import 'dart:convert';

import 'package:homefort/commons/http_request.dart';
import 'package:homefort/model/core/photo.dart';
import 'package:http/http.dart';

class PhotoHelper {
  static HttpRequest httpRequest = HttpRequest();

  static Future<List<Photo>> getPhotos({required int albumId}) async {
    try {
      Response response =
          await httpRequest.getMethod("albums/", '$albumId/photos');

      var decodedRes = jsonDecode(response.body);

      if (response.statusCode > 200 || (decodedRes as List).isEmpty) {
        throw "An error occured while loading photos";
      }
      return decodedRes.map((e) => Photo.fromMap(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
