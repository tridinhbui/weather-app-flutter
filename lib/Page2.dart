import 'package:flutter/material.dart';
import 'package:weather_app/list_weather.dart';
import 'package:weather_app/repositories.dart';
import 'package:weather_app/weather_response.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  WeatherResponse _weatherResponse = WeatherResponse();
  bool isLoading = true;

  @override
  void initState() {
    _initialData();
    super.initState();
  }

  void _initialData() async {
    final result = await weatherData(lat: 44.9396861, log: -93.1760933);
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
          child: Image.asset("assets/images/saint_paul.jpeg",
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
                  "Saint Paul",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "${((_weatherResponse.mainEntity?.temp ?? 273.15) - 273.15).toInt()}°C",
                  style: TextStyle(fontSize: 70, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "${"Today temp"}",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Text(
                    "High: ${((_weatherResponse.mainEntity?.tempMin ?? 273.15) - 273.15).toInt()}°  Low: ${((_weatherResponse.mainEntity?.tempMin ?? 273.15) - 273.15).toInt()}°",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
              Expanded(
                  child: ListWeather(
                weatherResponse: _weatherResponse,
              )),
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
