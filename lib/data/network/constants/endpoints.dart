class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://apistg.nabed_test.com/api";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;


  static const String DashboardInfoUrl = baseUrl + "/app/dashboard";
  static const String GalleryInfoUrl = baseUrl + "https://pixabay.com/api/";
}