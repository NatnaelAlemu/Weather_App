import 'package:flutter/material.dart';
import 'weather_tile.dart';

// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
class Main_ui extends StatelessWidget {
  String location;
  double temp;
  double tempMin;
  double tempMax;
  int humidity;
  double windspeed;
  int pressure;

  Main_ui(
      {@required this.location,
      @required this.temp,
      @required this.tempMin,
      @required this.tempMax,
      @required this.windspeed,
      @required this.pressure,
      @required this.humidity});

  factory Main_ui.fromJson(Map<String, dynamic> json) {
    return Main_ui(
        location: json['name'],
        temp: json['main']['temp'],
        tempMin: json['main']['tem_min'],
        tempMax: json['main']['temp_max'],
        windspeed: json['wind']['speed'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity']);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
          color: Color(0xff1a237e),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${location.toString()}",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                "${temp.toInt().toString()}°",
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Text(
              "High of ${tempMax.toInt().toString()}°,  Low of ${tempMin.toInt().toString()}°",
              style: TextStyle(
                  color: Colors.purple,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            WeatherTile(
                icon: Icons.thermostat_outlined,
                title: "Tempreture",
                subtile: "${temp.toInt().toString()}"),
            WeatherTile(
                icon: Icons.wrap_text_sharp,
                title: "Wind",
                subtile: "${windspeed.toInt().toString()}Mph"),
            WeatherTile(
                icon: Icons.speed,
                title: "Pressure",
                subtile: "${pressure.toString()}hpa"),
            WeatherTile(
                icon: Icons.opacity,
                title: "Humidity",
                subtile: "${humidity.toString()}%"),
          ],
        ),
      ))
    ]);
  }
}
