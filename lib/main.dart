// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'WeatherInfo.dart';
import 'main_ui.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<WeatherInfo> futureweather;
  @override
  initState() {
    super.initState();
    futureweather = fetchweather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: FutureBuilder<WeatherInfo>(
            future: futureweather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Main_ui(
                    location: snapshot.data.location,
                    temp: snapshot.data.temp,
                    tempMin: snapshot.data.tempMin,
                    tempMax: snapshot.data.tempMax,
                    windspeed: snapshot.data.windspeed,
                    pressure: snapshot.data.pressure,
                    humidity: snapshot.data.humidity);
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
