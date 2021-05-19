class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://dinghost.daustany.ir";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  static const String authenticate = baseUrl + "/api/TokenAuth/Authenticate";
}
