import 'package:example/productlist.dart';
import 'package:flutter/material.dart';
import 'package:flexi_cart_updater/flexi_cart_updater.dart';

void main() async {

  flexi_cart.instance.initialize(
      flexi_cart_icon: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
      flexi_badge_background: Colors.blue,
      flexi_badge_foreground: Colors.white,
      flexi_cart_count: 0);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'flexi_cart_updater',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flexi_cart_updater demo'),
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
  void initState() {
    super.initState();

    flexi_cart.instance.update(newCartCount: 10);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[

            flexi_cart.instance.cart(onTap: (){

            }),
            

            ElevatedButton(
                onPressed: (){

                  flexi_cart.instance.add();

                },
                child: Text("Add to Cart")
            ),

            const SizedBox(height: 10,),

            ElevatedButton(
                onPressed: (){

                  flexi_cart.instance.remove();

                },
                child: Text("Remove from Cart")
            ),

            const SizedBox(height: 10,),

            ElevatedButton(
                onPressed: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              productlist()));

                },
                child: Text("Products list screen")
            ),

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
