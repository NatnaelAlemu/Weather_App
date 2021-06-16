import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeatherTile extends StatelessWidget {
  IconData icon;
  String title;
  String subtile;

  WeatherTile({this.icon, @required this.title, @required this.subtile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon)],
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtile,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
