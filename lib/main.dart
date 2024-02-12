import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AspectRatio(
        aspectRatio: 0.4614561028,
        child: MaterialApp(
          home: HomePage(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
