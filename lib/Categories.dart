import 'package:amit_project/Categories1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class categories {
  int id = 0;
  String name = '';
  String avatar = '';

  categories.fromJson(Map<String, dynamic> json){
    avatar = json['avatar'];
    name = json['name'];
    id = json['id'];
  }
}

class _CategoriesState extends State<Categories> {

  List data1 = [];
  dynamic test1;
  List d1 = [];

  Future<String> getData() async {
    print('get data started');
    var response = await http.get(
      Uri.parse("https://retail.amit-learning.com/api/categories?fbclid=IwAR3876siPmg7RIPza7Rk3GT2waV5yYHZZ63FD8-nfXsWj1NkeekyMHOKmNU"),
    );
    print(response.statusCode);
    this.setState(() {
      test1 = jsonDecode(response.body);
    });

    d1 = test1['categories'];
    for (final h in d1) {
      data1.add(categories.fromJson(h));
    }

    print(" data new length${data1.length}");

    return "Success!";
  }
  @override

  void initState() {
    this.getData();
  }


  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: data1 == null ? 0 : data1.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio: 2/3),
        controller: ScrollController(keepScrollOffset: false),
        itemBuilder: (context, index)=> Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(2.5, 2.5, 5, 5),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Color(0xFF144552),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 50),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    image: NetworkImage(
                        data1[index].avatar),//==================================avatar
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(data1[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white)),
                  )],
                )
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Categories1(catId: data1[index].id, categoryName: data1[index].name),
                    ));
              },
            )
          ],
        )
    );

  }
}
