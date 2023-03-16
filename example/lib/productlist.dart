import 'package:flexi_cart_updater/flexi_cart_updater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class productlist extends StatefulWidget {

  @override
  State<productlist> createState() => _productlistState();
}

class _productlistState extends State<productlist> {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the productlist object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("product list"),
        actions: [

          Icon(Icons.search,color: Colors.black,),

         flexiCart.instance.cart(onTap: (){
            print("cart clicked");
          })
        ],
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            flexiCart.instance.cart(onTap: (){

              //redirect to your cart list screen
              print("cart icon clicked");

            }),

            const SizedBox(height: 10,),
            Text("Product Page"),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
