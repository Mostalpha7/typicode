import 'package:flutter/material.dart';
import 'package:homefort/model/core/photo.dart';
import 'package:homefort/model/helper/photo_helper.dart';

class PhotoProvider extends ChangeNotifier {
  List<Photo> _allPhotos = [];
  List<Photo> get allPhotos => _allPhotos;

  Future<List<Photo>> getPhoto({required int albumId}) async {
    try {
      List<Photo> result = await PhotoHelper.getPhotos(albumId: albumId);
      _allPhotos.addAll([...result]);
      notifyListeners();
      return _allPhotos;
    } catch (e) {
      throw e.toString();
    }
  }
}
