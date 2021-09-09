import 'package:flutter/material.dart';
import 'package:pratibha_clone/screens/login.dart';

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
      theme: ThemeData(primaryColor: Colors.grey),
      debugShowCheckedModeBanner: false,
      routes: {
        '/login': (context) => const Login(),
      },
      home: const Login(),
    );
  }
}
