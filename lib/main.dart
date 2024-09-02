import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model_api/Homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( 
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(  
theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner:  false,
    home: Homepage(),



    );
  }
}