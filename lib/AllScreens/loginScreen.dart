import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_app/AllScreens/mainscreen.dart';
import 'package:my_app/AllScreens/registrationScreen.dart';
import 'package:my_app/AllWidgets/progressDialog.dart';
import 'package:my_app/main.dart';

class LoginScreen extends StatelessWidget {
  static const String idScreen="login";
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
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
                        "Login",
                        style: TextStyle(fontSize: 18.0,fontFamily: "Brand Bold"),
                      ),
                    ),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0),
                  ),
                  onPressed: (){
                    if(!emailTextEditingController.text.contains("@")){
                      displayToastMessage("email not valid", context);

                    }else if(passwordTextEditingController.text.isEmpty){
                      displayToastMessage("password is incorrect", context);
                    }else{
                      loginAndAuthenticateUser(context);
                    }

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
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

 void loginAndAuthenticateUser(BuildContext context) async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
      return ProgressDialog("Authenfication in progress , please wait");
    });
    final User firebaseUser=(await _firebaseAuth.signInWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text).catchError((errMsg){
      Navigator.pop(context);
      displayToastMessage("error"+errMsg.toString(), context);
    })).user;

    if(firebaseUser!=null)
      //user created
        {
      //save user info a weld mi to database



      usersRef.child(firebaseUser.uid).once().then((DataSnapshot snap){
        if(snap.value!=null){
          Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
          displayToastMessage("You are logged in.", context);
        }else{
          Navigator.pop(context);
          _firebaseAuth.signOut();
          displayToastMessage("no record for this user , please create new account", context);
        }
      });

    } else{
      //error a weld khalti
      Navigator.pop(context);
      displayToastMessage("Error", context);
    }
  }
}

