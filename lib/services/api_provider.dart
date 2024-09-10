import 'dart:convert';
import 'package:weatehr_app/model/weather_model.dart';
import 'package:weatehr_app/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  AppUrl appUrl = AppUrl();
  // var apiKey = AppUrl().apiKey;
  WeatherModel weatherModel = WeatherModel();
  // String coverUrl = "weather?q=$city&appid=";

  Future<WeatherModel> getWeatherData(String city) async {
    // print("its call");
    String coverUrl = "weather?q=$city&appid=";
    Uri uri = Uri.parse(appUrl.baseUrl + coverUrl + appUrl.apiKey);

    final responce = await http.get(uri);
    // print("get respo ${responce.body}");
    var data = jsonDecode(responce.body.toString());
    // print("its data : $data");

    if (responce.statusCode == 200) {
      weatherModel = WeatherModel.fromJson(data);
      return weatherModel;
    } else if (responce.statusCode == 404) {
      weatherModel.cod = 404;
      return weatherModel;
    } else {
      return weatherModel;
    }
  }
}
