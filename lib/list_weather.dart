import 'package:flutter/material.dart';
import 'package:weather_app/weather_response.dart';

class ListWeather extends StatelessWidget {
  final WeatherResponse weatherResponse;

  const ListWeather({
    Key? key,
    required this.weatherResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: weatherResponse.weatherEntity?.length,
        itemBuilder: (context, index) {
          final item = weatherResponse.weatherEntity?[index];
          return Container(
            margin: EdgeInsets.only(left: 5, right: 5),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Text("Weather today:  ${item?.description?.toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  )),
            ),
          );
          ;
        });
  }
}
