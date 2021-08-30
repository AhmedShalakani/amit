import 'package:amit_project/ShowItem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'Cart.dart';


class Categories1 extends StatefulWidget {
  final int catId;
  final String categoryName;
  Categories1({required this.catId,
    required this.categoryName});
  @override
  _Categories1State createState() => _Categories1State(categoryName);


}



class Product {
  String title = '';
  String avatar = '';
  String name = '';
  dynamic price_final = 0;
  dynamic price = 0;
  int id = 0;
  int in_stock = 0;
  int category_id = 0;

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    avatar = json['avatar'];
    name = json['name'];
    id = json['id'];
    price_final = json['price_final'];
    price = json['price'];
    in_stock = json['in_stock'];
    category_id = json['category_id'];
  }
}


class _Categories1State extends State<Categories1> {
  List data = [];
  List filteredData = [];
  dynamic test;
  List d = [];
  String categoryName;

  _Categories1State(this.categoryName);

  Future<String> getData() async {
    var response = await http.get(
      Uri.parse("https://retail.amit-learning.com/api/products"),
    );
    this.setState(() {
      test = jsonDecode(response.body);
    });

    d = test['products'];
    for (final h in d) {
      data.add(Product.fromJson(h));
    }
    filteredData = data.where((element) => element.category_id == widget.catId).toList();
    print(" data new length${data.length}");
    print(" data new length${filteredData.length}");

    return "Success!";
  }

  @override
  void initState() {
    this.getData();
  }

  SnackBar mysnackbar = SnackBar(
    content: Text(
      'Item added ',
      style: TextStyle(
        fontSize: 20,
      ),
    ),

    backgroundColor: Color(0xFF006466),
    duration: Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          title: Text(categoryName,
            style: TextStyle(color: Color(0xFF006466)),),
          elevation: 0,
          backgroundColor: Colors.white,

          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xFF006466),
              )),

        ),
        body: ListView.builder(
          itemCount: data == null ? 0 : filteredData.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                InkWell(
                  onTap: (){
                    setState(() {


                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowItem(
                              title: filteredData[index].title,
                              name: filteredData[index].name,
                              avatar: filteredData[index].avatar,
                              in_stock: filteredData[index].in_stock,
                              price_final: filteredData[index].price_final,
                              price: filteredData[index].price,
                            ),

                          ));
                      showItemsIndex.add(filteredData[index]);
                    });
                  },
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      borderOnForeground: false,
                      elevation: 6,
                      child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: NetworkImage(filteredData[index].avatar.toString()),
                                    )),
                                width: size.width*0.32,
                                height: size.height*0.14,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: size.width*0.59,
                                    child: Text(filteredData[index].title.toString(), //================================title
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.black)),
                                  ),
                                  Row(
                                    children: [
                                      Text('${filteredData[index].price_final.toString()} EGP', //======================final price
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                              color: Colors.black)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      filteredData[index].price_final != filteredData[index].price
                                          ? Text(
                                          '${filteredData[index].price.toString()} EGP',
                                          //======================final price
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              decoration: TextDecoration.lineThrough,
                                              fontSize: 15,
                                              color: Colors.red))
                                          : Container()
                                    ],
                                  ),
                                  Text(
                                      '${filteredData[index].in_stock.toString()} in stock', //================================final price
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15,
                                          color: Colors.black)),
                                ],
                              ),
                            ],
                          ),

                          Positioned(
                            bottom: 7,
                            right: 7,
                            child: FloatingActionButton(
                                child: Icon(Icons.shopping_cart),
                                backgroundColor: Color(0xFF006466),
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    cartList.add(filteredData[index]);

                                    ScaffoldMessenger.of(context).showSnackBar(mysnackbar);


                                  });
                                }
                            ),
                          )
                        ],
                      )),
                )
              ],
            );
          },
        ),

      ),
    );
  }
}
