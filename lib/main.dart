import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/models/cart_model.dart';
import 'package:untitled/pages/HomePage.dart';
import 'package:untitled/pages/ItemPage.dart';
import 'package:untitled/pages/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        // routes: {
        //   "/": (context) => SplashScreen(),
        //   "homePage": (context) => HomePage(),
        //   "ItemPage": (context) => ItemPage(price: 9, description: "", imageProvider: "", rating: "",),
        // },
      ),
    );
  }
}
