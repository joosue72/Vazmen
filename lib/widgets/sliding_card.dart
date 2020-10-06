import 'package:flutter/material.dart';
import 'package:vazmen/Grafica_Ventas/venta_grafica.dart';

class SlidingCard extends StatelessWidget {
  final String name; //<-- title of the event
  final String date; //<-- date of the event
  final String assetName; //<-- name of the image to be displayed
 final double offset;    
  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)), //<--custom shape
      child: Column(
        children: <Widget>[
          ClipRRect(  //<--clipping image
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)), 
            child: Image.asset( //<-- main image
              'assets/$assetName',
              height: MediaQuery.of(context).size.height * 0.3,
               alignment: Alignment(-offset.abs(), 0),
              fit: BoxFit.none,
            ),
          ),
          SizedBox(height: 8),
           Expanded(
           child: _CardContent( //<--replace the Container with CardContent
          name: name,
          date: date,
        ),
      ),
        ],
      ),
    );
  }
}


class _CardContent extends StatelessWidget {
  final String name;
  final String date;

  const _CardContent({Key key, @required this.name, @required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 20)),
          SizedBox(height: 8),
          Text(date, style: TextStyle(color: Colors.grey)),
          Spacer(),
          Row(
            children: <Widget>[
              
              Spacer(),
             RaisedButton(
                color: Color(0xFF162A49),
                child: Text('Abrir'),
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                onPressed: () {
                   Route route = MaterialPageRoute(builder: (bc) => VentaGrafica());
                                                Navigator.of(context).push(route);
                },
              ),
              SizedBox(width: 16),
            ],
          )
        ],
      ),
    );
  }
}