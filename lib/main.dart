import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_app/AllScreens/loginScreen.dart';
import 'package:my_app/AllScreens/mainscreen.dart';
import 'package:my_app/AllScreens/registrationScreen.dart';
import 'package:my_app/DataHandler/appData.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => appData(),
      child: MaterialApp(
        title: 'Jobs Finder App',
        theme: ThemeData(
          fontFamily: "Signatra",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: MainScreen.idScreen,
        routes: {
          RegistraionScreen.idScreen: (context) => RegistraionScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
