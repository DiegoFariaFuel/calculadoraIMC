import 'package:flutter/material.dart';

import 'Pages/home_page.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MeuAplicativo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

