import 'package:flutter/material.dart';
import 'package:my_app/DataHandler/employees.dart';
import 'package:my_app/classes/employee.dart';
import 'package:provider/provider.dart';

class DetailEmployee extends StatefulWidget {
  static const String idScreen = "/detail";

  @override
  _DetailEmployeeState createState() => _DetailEmployeeState();
}

class _DetailEmployeeState extends State<DetailEmployee> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final employeesData = Provider.of<Employees>(context).data;
    final id = ModalRoute.of(context).settings.arguments;
    Employee selectedEmp = null;
    employeesData.forEach(
      (element) {
        if (element.index == id) {
          selectedEmp = element;
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee " + id.toString()),
      ),
      body: Container(
        height: size.height / 0.7,
        width: size.width / 0.7,
        child: Column(
          children: [
            Text(selectedEmp.name),
          ],
        ),
      ),
    );
  }
}
