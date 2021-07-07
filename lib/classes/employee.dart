import 'package:flutter/material.dart';

class Employee with ChangeNotifier {
  final int index;
  final String name;
  final String about;
  final int age;
  final double lon;
  final double lat;
  final String phone;
  final String email;

  Employee({
    @required this.index,
    @required this.name,
    @required this.about,
    @required this.age,
    @required this.lon,
    @required this.lat,
    @required this.phone,
    @required this.email,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      index: json["index"],
      about: json["about"],
      name: json["name"],
      age: json["age"],
      lon: json["longitude"],
      lat: json["latitude"],
      phone: json["phone"],
      email: json["email"],
    );
  }
}
