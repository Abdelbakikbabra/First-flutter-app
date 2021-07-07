import 'package:flutter/material.dart';
import 'package:my_app/AllScreens/detail_page.dart';
import 'package:my_app/DataHandler/employees.dart';
import 'package:my_app/classes/employee.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String idScreen = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> employees = [];
  @override
  @override
  void didChangeDependencies() {
    Provider.of<Employees>(context).fetchEmployees();
    Provider.of<Employees>(context).data.forEach(
      (element) {
        employees.add(element);
      },
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final employeesData = Provider.of<Employees>(context, listen: false).data;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("All employees"),
      ),
      body: ListView.builder(
        itemCount: employeesData.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              DetailEmployee.idScreen,
              arguments: employeesData[index].index,
            ),
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.info),
                      Text(employeesData.length.toString()),
                      Text(employeesData[index].name),
                      Text(employeesData[index].age.toString()),
                    ],
                  ),
                  Text(employeesData[index].phone),
                  Text(employeesData[index].email),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
