import 'package:flutter/material.dart';

import 'presentation/home/home_screen.dart';

void main() {
  runApp(MyMatrixApp());
}

class MyMatrixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrix App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
