import 'package:flutter/material.dart';
import 'package:vazmen/Animation/FadeAnimation.dart';
import 'package:vazmen/homepage.dart';
import 'package:vazmen/widgets/sliding_cards.dart';

class Menug extends StatefulWidget {
  const Menug({Key key}) : super(key: key);

  @override
  _MenugState createState() => _MenugState();
}

class _MenugState extends State<Menug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getCustomAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Menu de Graficas', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
            ),
            SizedBox(height: 60),
            SlidingCardsView()
          ],
        ),
      ),
    );
  }

  _getCustomAppBar(){
  return PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
      
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
    
  );

        }),
       
        IconButton(icon: Icon(Icons.insert_chart), onPressed: (){}),
      ],),
    ),
  );
}
}


