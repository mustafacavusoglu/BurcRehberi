import 'package:flutter/material.dart';
import 'screens/burcList.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Burç Rehberi",
      theme :ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:BurcList() ,
    );
  }
}
