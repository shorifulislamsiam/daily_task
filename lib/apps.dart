import 'package:flutter/material.dart';
import 'package:task_management_app/ui/screen/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),

      theme: ThemeData(
        colorSchemeSeed: Colors.grey,
        textTheme: TextTheme(),
      ),

    );
  }
}
