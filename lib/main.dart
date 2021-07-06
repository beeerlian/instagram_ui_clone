import 'package:flutter/material.dart';
import 'package:instagram_ui_remake/ui/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}