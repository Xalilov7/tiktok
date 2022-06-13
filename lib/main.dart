import 'package:flutter/material.dart';

import 'NavgationContainer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Tik tok',
      theme: ThemeData(
        // textTheme: GoogleFonts.varelaRoundTextTheme()
      ),
      home: const NavgationConatiner(),
    );
  }
}

