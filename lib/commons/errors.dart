class InternetConnectionError implements Exception {
  String get message =>
      "Connection could not be established. Please check internet connection";

  @override
  String toString() =>
      "Connection could not be established. Please check internet connection";
}
