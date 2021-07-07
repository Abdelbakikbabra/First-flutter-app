import 'package:flutter/material.dart';
import 'package:my_app/AllScreens/loginScreen.dart';

class WelcomePage extends StatelessWidget {
  static const String idScreen = "/wlcm";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      height: size.height / 0.7,
      width: size.width / 0.7,
      child: Column(
        children: [
          Text("Choose !!"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(LoginScreen.idScreen),
            child: Text("Client"),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(LoginScreen.idScreen),
              child: Text("Employee")),
        ],
      ),
    ));
  }
}
