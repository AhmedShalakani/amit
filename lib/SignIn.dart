import 'package:amit_project/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'Signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

final formkey = GlobalKey<FormState>();

bool obscureText = true;

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Form(
        key: formkey,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: size.height,
              width: size.width,

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [


                Flexible(
                  flex: 1,
                  child: Image(
                    image: AssetImage('images/undraw_moonlight_5ksn.png'),
                    height: 300,
                    width: 300,
                  ),
                ),


                Row(
                  children: [

                    Flexible(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF312244),
                                    ),
                                  ),
                                  labelText: 'Name',
                                  labelStyle: TextStyle(color: Color(0xFF312244))
                              ),
                              cursorColor: Color(0xFF312244),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'name is required';
                                }
                                if (value.length > 12){
                                  return "your name can't be more than 12 letters";
                                }
                                else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        )),



                  ],
                ),


                Padding(
                  padding: EdgeInsets.all(4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF312244),width: 2
                          ),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Color(0xFF312244))
                    ),
                    cursorColor: Color(0xFF312244),
                    validator: (value) {
                      if (value!.contains('@')) {
                        return null;
                      } else {
                        return '@ is nedded';
                      }
                    },
                  ),
                ),


                Padding(
                  padding: EdgeInsets.all(4),
                  child: TextFormField(
                    obscureText: obscureText,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            tooltip: 'show password',
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.grey,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFF312244),width: 2
                          ),
                        ),
                        labelText: 'password',
                        labelStyle: TextStyle(color: Color(0xFF312244))
                    ),
                    cursorColor: Color(0xFF312244),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'you need to enter a password';
                      } else if (value.contains(' ')) {
                        return "you password can't contain a Space";
                      } else if (value.length > 8){
                        return "your password can't be more than 8 letters";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),


                Spacer(),


                ElevatedButton(
                  onPressed: onPressed,
                  child: Text('Sign Up!'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF312244), // background
                    // foreground
                  ),
                ),


                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Singup()));
                        },
                        child: Text(
                          'already signed in?',
                          style: TextStyle(decoration: TextDecoration.underline),
                        ))),

                SizedBox(
                  height: 30,
                )
              ],
            ),],
        )
    );

  }

  void onPressed() {
    if (formkey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ));
    }
  }
}
