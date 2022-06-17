import 'package:flutter/material.dart';
import 'package:weather_app/list_weather.dart';
import 'package:weather_app/repositories.dart';
import 'package:weather_app/weather_response.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  WeatherResponse _weatherResponse = WeatherResponse();
  bool isLoading = true;


  @override
  void initState() {
    _initialData();
    super.initState();
  }

  void _initialData() async {
    final result = await weatherData(lat: 21.0266975, log: 105.7691939);
    setState(() {
      _weatherResponse = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Image.asset("assets/images/hanoi.jpg",
              fit: BoxFit.fill, height: MediaQuery.of(context).size.height),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 65),
                child: Text(
                  style: TextStyle(fontSize: 35, color: Colors.white),
                  "Hà Nội",
                ),

              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Text(
                  "${((_weatherResponse.mainEntity?.temp ?? 273.15) - 273.15).toInt()}°C",
                  style: const TextStyle(fontSize: 70, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "Today temp",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Text(
                    "High: ${((_weatherResponse.mainEntity?.tempMin ?? 273.15) - 273.15).toInt()}°  Low: ${((_weatherResponse.mainEntity?.tempMin ?? 273.15) - 273.15).toInt()}°",
                    style: const TextStyle(fontSize: 25, color: Colors.white)),
              ),
              _weatherResponse.weatherEntity != null
                  ? Expanded(
                      child: ListWeather(
                      weatherResponse: _weatherResponse,
                    ))
                  : const SizedBox(),
            ],
          ),
        ),
        Visibility(
            visible: isLoading,
            child: const Center(
                child: CircularProgressIndicator(color: Colors.red)))
      ],
    );
  }

}
