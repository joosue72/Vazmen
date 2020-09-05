import 'package:flutter/material.dart';
import 'splash.dart';




void main() => runApp(new MyApp(
  
));

class MyApp extends StatelessWidget{
 
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollPage(),
    );
    
  }
}
