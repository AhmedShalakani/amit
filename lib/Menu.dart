import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('profile'),
          leading: Icon(Icons.perm_contact_calendar),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(),
                ));
          },
        ),
        ListTile(
          title: Text('settings'),
          leading: Icon(Icons.settings),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () {},
        ),
        ListTile(
          title: Text('display'),
          leading: Icon(Icons.settings_display_sharp),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () {},
        ),
        ListTile(
          title: Text('security & privacy'),
          leading: Icon(Icons.home),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Security(),
                ));
          },
        ),
      ],
    );
  }
}

class Profile extends StatelessWidget {
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
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Color(0xFF144552),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Color(0xFF144552),
                  radius: 80,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'username',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Security extends StatelessWidget {
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
        appBar: AppBar(
          title: Text('security & privacy'),
          backgroundColor: Color(0xFF144552),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body: Container(
            margin: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Text(
                    'We will only use your personal information in accordance with this Policy unless otherwise required by applicable law. We take steps to ensure that the personal information that we collect about you is adequate, relevant, not excessive, and used for limited purposes. All employees and contractors of Dialogue collecting and processing personal information in accordance with this Policy are required to adhere to the protections described in this Policy. Whenever we engage a third-party service provider or whenever we work with a new partner, we ensure that the information is properly safeguarded at all times at a comparable level of protection the information would have received if it had not been transferred.'),
                Text(
                    'We use different methods to collect your information, including:'),
                Text(
                    'Through direct interactions with you through the Website, the App, the Platform or during Consultations when you provide it to us, for example, by filling in forms and questionnaires, by receiving care from our healthcare practitioners or by receiving orientation and counselling  services from our professionals. '),
                Text(
                    'Automatically, through cookies and other automated data collection technologies or interactions, as you navigate through our Website and the Platform. Information collected automatically may include usage details, IP addresses, and information collected through cookies, web beacons, and other tracking technologies (the “Activity Information”).'),
              ],
            )),
      ),
    );
  }
}
