import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_app/AllScreens/detail_page.dart';
import 'package:my_app/AllScreens/home_page.dart';
import 'package:my_app/AllScreens/loginScreen.dart';
import 'package:my_app/AllScreens/mainscreen.dart';
import 'package:my_app/AllScreens/registrationScreen.dart';
import 'package:my_app/AllScreens/welcome_page.dart';
import 'package:my_app/DataHandler/appData.dart';
import 'package:my_app/DataHandler/employees.dart';
import 'package:my_app/classes/employee.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Employees>(
          create: (context) => Employees(),
        ),
      ],
      child: MaterialApp(
        title: 'Jobs Finder App',
        theme: ThemeData(
          fontFamily: "Signatra",
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: WelcomePage.idScreen,
        routes: {
          //JobListing.idScreen: (context) => JobListing(),
          RegistraionScreen.idScreen: (context) => RegistraionScreen(),
          WelcomePage.idScreen: (context) => WelcomePage(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
          HomePage.idScreen: (context) => HomePage(),
          DetailEmployee.idScreen: (context) => DetailEmployee(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
