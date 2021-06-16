import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'location.dart'

LocationCoordinates location = new LocationCoordinates();

Future<WeatherInfo> fetchweather() async {
  final String apikey = 'df7a7773f2abbe06a3159800319aa824';
  final String requestUrl =
      'api.openweathermap.org/data/2.5/weather?lat={location._latitude}&lon={location._longitude}&appid={apiKey}';

  final response = await http.get(Uri.parse(requestUrl));

  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load The Url");
  }
}

class WeatherInfo {
  String location;
  double temp;
  double tempMin;
  double tempMax;
  int humidity;
  double windspeed;
  int pressure;

  WeatherInfo(
      {@required this.location,
      @required this.temp,
      @required this.tempMin,
      @required this.tempMax,
      @required this.windspeed,
      @required this.pressure,
      @required this.humidity});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
        location: json['name'],
        temp: json['main']['temp'],
        tempMin: json['main']['tem_min'],
        tempMax: json['main']['temp_max'],
        windspeed: json['wind']['speed'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity']);
  }
}
