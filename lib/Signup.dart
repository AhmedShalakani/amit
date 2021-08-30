import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LoginScreen.dart';



class Singup extends StatefulWidget {
  @override
  _SingupState createState() => _SingupState();
}

final formkey = GlobalKey<FormState>();

bool obscureText = true;

class _SingupState extends State<Singup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme,
        ),
        ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Image(
                    image: AssetImage('images/undraw_dreamer_gxxi.png'),
                    height: 300,
                    width: 300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFF312244), width: 2),
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
                        borderSide:
                            BorderSide(color: Color(0xFF312244), width: 2),
                      ),
                      labelText: 'password',
                      labelStyle: TextStyle(color: Color(0xFF312244)),
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
                    primary: Color(0xFF312244),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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
