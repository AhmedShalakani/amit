import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ShowItem.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();


}

var cartList = [];

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [ListView(
        children: List.generate(
          cartList.length,
              (index) => Stack(
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShowItem(

                            title: cartList[index].title,
                            name: cartList[index].name,
                            avatar: cartList[index].avatar,
                            in_stock: cartList[index].in_stock,
                            price_final: cartList[index].price_final,
                            price: cartList[index].price,

                          ),
                        ));
                    showItemsIndex.add(cartList[index]);
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
                                    image: NetworkImage(cartList[index].avatar.toString()),
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
                                  child: Text(cartList[index].title.toString(), //================================title
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black)),
                                ),
                                Row(
                                  children: [
                                    Text('${cartList[index].price_final.toString()} EGP', //======================final price
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.black)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    cartList[index].price_final != cartList[index].price
                                        ? Text(
                                        '${cartList[index].price.toString()} EGP',
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
                                    '${cartList[index].in_stock.toString()} in stock', //================================final price
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
                              child: Icon(Icons.remove),
                              backgroundColor: Color(0xFF006466),
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  cartList.remove(cartList[index]);
                                  SnackBar mysnackbar = SnackBar(
                                    content: Container(
                                      height: size.width*0.1,
                                      child: Text(
                                        'Item removed', //=============================================
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
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
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
        Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(8),
                height: size.height*0.065,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),

                  color: Color(0xFF006466),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Check Out...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),),
                ),
              ),
            )
        ),


      ],
    );
  }
}
