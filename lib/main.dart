import 'package:flutter/material.dart';
import 'homepage.dart';




void main() => runApp(new MyApp(
  
));

class MyApp extends StatelessWidget{
 
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
    
  }
}
