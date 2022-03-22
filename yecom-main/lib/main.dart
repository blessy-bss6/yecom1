import 'package:flutter/material.dart';
import 'package:shop/Screen/LoginScr.dart';
import 'package:shop/Screen/OrderDetScr.dart';
import 'package:shop/Screen/cartScr.dart';

import 'Screen/splashScr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sliver Plated',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        // home: SplashScreen(),
        // home: OrderDeatilsScreen()
        // home: LoginScreen(),
        home: CartScreen()
        // home: UserNavigationBar()
        // home: CategoryScreen()
        );
  }
}
