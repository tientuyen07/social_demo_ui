import 'package:flutter/material.dart';
import 'package:social_demo_ui/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.blue),
      ),
      home: const LoginScreen(),
    );
  }
}
