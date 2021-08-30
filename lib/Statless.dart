import 'package:amit_project/SignIn.dart';
import 'package:flutter/material.dart';


class Statless extends StatelessWidget {

  @override
  final formkey = GlobalKey<FormState>();


  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignIn()
      ),
    );
  }
}
