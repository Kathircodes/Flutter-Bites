import 'package:flutter/material.dart';
import 'package:flutter_bites/providers/food_item_provider.dart';
import 'package:flutter_bites/screens/intro_screen.dart';
import 'package:flutter_bites/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<FoodItemProvider>(
          create: (context) => FoodItemProvider())
    ],
    child: const MyApp(),
  ));
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
      theme: theme,
    );
  }
}
