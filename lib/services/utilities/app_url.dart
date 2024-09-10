class AppUrl {
  String baseUrl = "https://api.openweathermap.org/data/2.5/";
  String apiKey = "103c72cc78d218f0c520b1df461a92fe";
  String getUrl(String baseUrl, coverUrl, apiKey) {
    return baseUrl + coverUrl + apiKey;
  }
}
