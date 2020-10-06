
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vazmen/splash.dart';

import 'Grafica_Ventas/details_page.dart';







void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
  onGenerateRoute: (settings) {
         if(settings.name == '/details'){
           DetailsPage1 params = settings.arguments;
           return MaterialPageRoute(builder: (BuildContext context){
             return DetailsParams(params: params,);});
         }

      
        
        }
));
}



class MyApp extends StatelessWidget{
 
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollPage(),
    );
    
  }
}
