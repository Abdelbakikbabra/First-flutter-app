import 'package:flutter/material.dart';
import 'package:my_app/AllScreens/registrationScreen.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen="login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 35.0,),
              Image(image: AssetImage("images/logo.png"),
              width: 350.0,
              height: 250.0,
              alignment: Alignment.center,
              ),

              SizedBox(height: 1.0,),
              Text("Login as a Job poster",
                style: TextStyle(fontSize: 24.0,fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(20.0),
              child: Column(children: [
                SizedBox(height: 1.0,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                  style: TextStyle(fontSize: 14.0,),
                ),
                SizedBox(height: 1.0,),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 14.0,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,
                    ),
                  ),
                  style: TextStyle(fontSize: 14.0,),
                ),
                SizedBox(height: 10.0,),
                // ignore: deprecated_member_use
                RaisedButton(
                  color: Colors.yellow,
                  textColor: Colors.white,
                  child: Container(
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 18.0,fontFamily: "Brand Bold"),
                      ),
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0),
                  ),
                  onPressed: (){
                    print("logged in cliked");
                  },
                ),
              ],),),
                  TextButton(onPressed: ()
                  {
                    Navigator.pushNamedAndRemoveUntil(context, RegistraionScreen.idScreen, (route) => false);
                  },
                   child:Text(
                   "Do not have an account? please Register here",
                 ),

                  ),
            ],
          ),
        ),
      ),
    );
  }
}

