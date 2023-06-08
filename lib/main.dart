import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/home.dart';
import 'package:learn_flutter/pages/loading.dart';
import 'package:learn_flutter/pages/choose_location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const Loading(),
        "/home": (context) => const Home(),
        "/location": (context) => const ChooseLocation(),
      },
    );
  }
}