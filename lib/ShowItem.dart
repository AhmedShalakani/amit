
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Cart.dart';



class ShowItem extends StatefulWidget {

  final String name;
  final String avatar;
  final String title;
  final int price_final;
  final int in_stock;
  final int price;



  ShowItem({
    required this.name,
    required this.avatar,
    required this.in_stock,
    required this.price_final,
    required this.title,
    required this.price,

  });

  @override
  _ShowItemState createState() => _ShowItemState();
}
var showItemsIndex=[];
class _ShowItemState extends State<ShowItem> {

  int qty = 1;


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
            title: Text(widget.title,
              style: TextStyle(
                  color: Color(0xFF144552)
              ),),
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  showItemsIndex.clear();

                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF144552),
                )),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 15,
                fit: FlexFit.tight,
                child: Container(
                  padding: EdgeInsets.all(7),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF4D194D),
                  ),

                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                        image: NetworkImage(widget.avatar),

                        // colorFilter:
                        // ColorFilter.mode(Colors.grey, BlendMode.darken)
                      ),
                    ),
                  ),
                ),
              ),


              Flexible(
                flex: 15,
                child: ListView(
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(17, 5, 17, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.90,
                              child: Text(
                                widget.title, //==========================================  title
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        )),


                    Padding(
                      padding: EdgeInsets.fromLTRB(17, 5, 17, 10),
                      child: Row(
                        children: [
                          Text(
                            '${widget.price_final.toString()} EGP', //===================================price
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),

                          SizedBox(
                            width: 10,
                          ),
                          widget.price_final != widget.price ?  Text(
                            '${widget.price.toString()} EGP', //===================================price
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 30,
                                color: Colors.red
                            ),
                          )
                              : Container()
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(17, 5, 17, 10),
                      child: Row(
                        children: [

                          Text(
                            '${widget.in_stock.toString()} in stock',  //========================================== stock
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(17, 5, 17, 10),
                      child: Row(
                        children: [  //============================================================ qty
                          Text("Qty :",style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),),
                          SizedBox(width: 20,),
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  if(qty > 1){
                                    setState(() {
                                      qty = --qty;
                                    });
                                  }
                                  // minus here
                                },
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle
                                  ),
                                  child: Icon(Icons.remove,size: 15,),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Text(qty.toString(),style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),),
                              SizedBox(width: 15,),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    qty = ++qty;
                                  });
                                  // minus here
                                },
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle
                                  ),
                                  child: Icon(Icons.add,size: 15,),
                                ),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(17, 5, 40, 10),
                      width: double.infinity,
                      child: Text(widget.name,  //================================================================== name
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          )),
                    ),

                  ],
                ),
              ),
            ],
          ),


          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                child: Icon(Icons.add_outlined),
                backgroundColor: Color(0xFF144552),
                mini: true,
                onPressed:(){
                  setState(() {
                    cartList.add(showItemsIndex.last);
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
                    ScaffoldMessenger.of(context).showSnackBar(mysnackbar);


                  });
                }
            ),
          )
      ),
    );
  }
}
