import 'dart:convert';

import 'package:weather_app/weather_response.dart';
import 'package:http/http.dart' as http;

Future<WeatherResponse> weatherData({required double lat, required double log}) async {
  http.Response response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$log&appid=baa4a0f56888cf14be617a4168fda304'));
  if (response.statusCode == 200) {
    String data = response.body;
    var decodedData = jsonDecode(data);
    return WeatherResponse.fromJson(decodedData);
  } else {
    print(response.statusCode);
  }
  return WeatherResponse();
}

