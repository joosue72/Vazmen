import 'package:flutter/material.dart';
import 'package:vazmen/homepage.dart';
import 'package:vazmen/widgets/sliding_cards.dart';
import 'package:google_fonts/google_fonts.dart';

class Menug extends StatefulWidget {
  const Menug({Key key}) : super(key: key);

  @override
  _MenugState createState() => _MenugState();
}

class _MenugState extends State<Menug> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _getCustomAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 20),
          
            SizedBox(height: 60),
            SlidingCardsView()
          ],
        ),
      ),
    );
  }

  _getCustomAppBar(){
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black,
            Colors.black
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: (){
          Route route = MaterialPageRoute(builder: (bc) => HomePage());
                                                Navigator.of(context).push(route);

        }),
        Text('Menu de Gráficas', style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(color: Colors.white)),),
        IconButton(icon: Icon(Icons.add_chart, color: Colors.white), onPressed: (){}),
      ],),
    ),
  );
}
}


