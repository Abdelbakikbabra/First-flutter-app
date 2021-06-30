import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_app/AllScreens/loginScreen.dart';
import 'package:my_app/AllScreens/mainscreen.dart';
import 'package:my_app/main.dart';

// ignore: must_be_immutable
class RegistraionScreen extends StatelessWidget {
  static const String idScreen="register";

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController specialityTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Image(image: AssetImage("images/logo.png"),
                width: 350.0,
                height: 250.0,
                alignment: Alignment.center,
              ),

              SizedBox(height: 1.0,),
              Text("Register as a Job poster",
                style: TextStyle(fontSize: 24.0,fontFamily: "Brand Bold"),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  SizedBox(height: 1.0,),
                  TextField(
                    controller: nameTextEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
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
                    controller: emailTextEditingController,
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
                    controller: specialityTextEditingController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Speciality",
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
                    controller: phoneTextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
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
                    controller: passwordTextEditingController,
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
                          "Create an account",
                          style: TextStyle(fontSize: 18.0,fontFamily: "Brand Bold"),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0),
                    ),
                    onPressed: (){
                      if(nameTextEditingController.text.length<3){
                        displayToastMessage("name must be atleast 3 chars", context);
                      }else if(!emailTextEditingController.text.contains("@")){
                        displayToastMessage("email not valid", context);

                      }else if(phoneTextEditingController.text.isEmpty){
                        displayToastMessage("phone Number is mandatory", context);
                      }
                      else if(specialityTextEditingController.text.isEmpty){
                        displayToastMessage("please fill the speciality text", context);
                      }
                      else if(passwordTextEditingController.text.length<4){
                        displayToastMessage("please fill the speciality text", context);
                      }else{
                        registerNewUser(context);
                      }

                    },
                  ),
                ],),),
              TextButton(onPressed: ()
              {
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
              },
                child:Text(
                  "Already have an Account ? Login here",
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  registerNewUser(BuildContext context) async {
    final User firebaseUser=(await _firebaseAuth.createUserWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text).catchError((errMsg){
      displayToastMessage("error"+errMsg.toString(), context);
    })).user;

    if(firebaseUser!=null)
    //user created
      {
      //save user info a weld mi to database

      Map userDataMap={
        "name":nameTextEditingController.text.trim(),
        "email":emailTextEditingController.text.trim(),
        "speciality":specialityTextEditingController.text.trim(),
        "phone":phoneTextEditingController.text.trim()
        ,

      };
      usersRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage("Your account has been created.", context);
      Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
    } else{
      //error a weld khalti
      displayToastMessage("new user account not been created yet", context);
    }
  }


}
displayToastMessage(String message,BuildContext context){
  Fluttertoast.showToast(msg: message);
}

