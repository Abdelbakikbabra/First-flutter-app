import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_app/classes/employee.dart';
import 'package:http/http.dart' as http;

class Employees with ChangeNotifier {
  List<Employee> _employees = [];
  List<Employee> get data {
    return [..._employees];
  }

  Future<void> fetchEmployees() async {
    try {
      final url =
          "http://www.json-generator.com/api/json/get/cedEufqdKa?indent=2";
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body);
      var data = extractedData as List;
      var list = data.map<Employee>((e) => Employee.fromJson(e)).toList();
      _employees = list;
      print(_employees[0].name);
      ChangeNotifier();
    } catch (error) {
      print(error);
    }
  }
}
