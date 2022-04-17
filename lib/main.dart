import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard/constants.dart';
import 'package:flutter_responsive_dashboard/controller/menu_controller.dart';
import 'package:flutter_responsive_dashboard/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor, canvasColor: secondaryColor),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuController())
        ],
        child: HomeScreen(),
      ),
    );
  }
}
