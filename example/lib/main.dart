import 'package:flutter/material.dart';
import 'package:flexi_cart_updater/flexi_cart_updater.dart';

void main() {

  FlexiCart.initFlexiCart(
      child: const Icon(Icons.shopping_cart_outlined,size: 25,color: Colors.black54,),
      cartCount: 2,
      cartBadgeTextColor: Colors.white,
      cartBadgeBackgroundColor: Colors.blueAccent);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flexi_cart_updater',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'flexi_cart_updater demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: [

          Icon(Icons.search,size: 25,color: Colors.black54,),

          FlexiCart.cart(onTap: (){
            print("Navigate to your cart screen here");
          }),
        ],
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            FlexiCart.cart(onTap: (){
              print("Navigate to your cart screen here");
            }),

            ElevatedButton(
                onPressed: ()=>FlexiCart.add(),
                child: Text("Add to Cart")
            ),

            const SizedBox(height: 10,),

            ElevatedButton(
                onPressed: ()=>FlexiCart.remove(),
                child: Text("Remove from Cart")
            ),

            const SizedBox(height: 10,),

            ElevatedButton(
                onPressed: ()=>FlexiCart.clear(),
                child: Text("Clear cart")
            ),

            const SizedBox(height: 10,),

            ElevatedButton(
                onPressed: ()=>FlexiCart.update(newCartCount: 4),
                child: Text("update cart with new value 4")
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
