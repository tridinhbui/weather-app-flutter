import 'package:flutter/material.dart';
import 'package:weather_app/list_weather.dart';
import 'package:weather_app/repositories.dart';
import 'package:weather_app/weather_response.dart';

class Page3 extends StatefulWidget {
  const Page3({
    Key? key,
  }) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  WeatherResponse _weatherResponse = WeatherResponse();
  bool isLoading = true;

  @override
  void initState() {
    _initialData();
    super.initState();
  }

  void _initialData() async {
    final result = await weatherData(lat: 35.6681625, log: 139.6007826);
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
          child: Image.asset("assets/images/tokyo.jpeg",
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
                  "Tokyo",
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

              ///Weather description
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
