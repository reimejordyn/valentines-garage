import 'package:flutter/material.dart';
import 'package:trial/admindash.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:trial/main.dart';

class Admin extends StatelessWidget {
  const Admin({Key? key, required String title}) : super(key: key);

  static const String title = 'Admin Login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: const AdminL(),
      ),
    );
  }
}

class AdminL extends StatefulWidget {
  const AdminL({Key? key}) : super(key: key);

  @override
  State<AdminL> createState() => _AdminLState();
}

class _AdminLState extends State<AdminL> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: ModalProgressHUD(
              inAsyncCall: showProgress,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Login Page",
                      style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        email = value; // get value from TextField
                      },
                      decoration: InputDecoration(
                          hintText: "Enter your Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        password = value; //get value from textField
                      },
                      decoration: InputDecoration(
                          hintText: "Enter your Password",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0)))),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      elevation: 5,
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32.0),
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            showProgress = true;
                          });

                          try {
                            final newUser = await _auth.signInWithEmailAndPassword(
                                email: email, password: password);

                            print(newUser.toString());


                            if (newUser != null) {
                              Fluttertoast.showToast(
                                  msg: "Login Successfull",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.redAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return const Admindash(title: 'Admin Dashboard');
                              }));

                              setState(() {
                                showProgress = false;
                              });
                            }
                          } catch (e) {}
                        },
                        minWidth: 200.0,
                        height: 45.0,
                        child: Text(
                          "Login",
                          style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ]

          )
          ),


        )
    );

  }
}