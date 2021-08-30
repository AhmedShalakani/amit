import 'package:amit_project/Categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Cart.dart';
import 'Menu.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();

}


List <Text> appbarname = [

  Text(
    'Categories',
    style: TextStyle(color: Color(0xFF006466)),
  ),
  Text(
    'Cart',
    style: TextStyle(color: Color(0xFF006466)),
  ),
  Text(
    'Menu',
    style: TextStyle(color: Color(0xFF006466)),
  )
];

List <Color> appBarColor =[
  Color(0xFF0B525B),
  Color(0xFF144552),
  Color(0xFF1B3A4B),
  Color(0xFF212F45)
];

List <Widget> myScreen =[

  Categories(),
  Cart(),
  Menu()
];

int mycurrentindex = 0;



class _LoginState extends State<Login> {


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
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: appbarname[mycurrentindex],
          elevation: 0,
        ),


        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: Color(0xFF006466)),
          showSelectedLabels: true,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF006466),
          unselectedItemColor: Color(0xFF006466),
          elevation: 0,
          onTap: (index) {
            setState(() {
              mycurrentindex = index;
            });
          },
          currentIndex: mycurrentindex,
          items: [

            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.category,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.menu,
                ),
                label: 'Menu'),
          ],
        ),
        body: myScreen[mycurrentindex],
      ),
    );
  }

}
