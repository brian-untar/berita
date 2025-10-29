import 'package:flutter/material.dart';
import 'home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Store',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ProductPage(),
    );
  }
}
