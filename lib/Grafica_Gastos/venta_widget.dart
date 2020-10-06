import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'details_page.dart';

import 'Grafica_Pie.dart';
import 'graph_widget.dart';

enum GraphType {
  LINES, PIE,
}




class VentaWidget extends StatefulWidget {

 final List<DocumentSnapshot> documents;
 final double total;
 final List<double> perDay;
 final Map<String,double>categories;
 final GraphType graphType;
 final int month;
 
 

   VentaWidget({Key key,@required this.month, this.graphType,this.documents}) : 
    total = documents.map((doc) => doc.data()['Cantidad'])
            .fold(0.0, (a, b) => a + b),
     
     
     perDay = List.generate(30, (int index){
       return documents.where((doc) => doc.data()['Dia'] ==(index + 1))
        .map((doc) => doc.data()['Cantidad'])
            .fold(0.0, (a, b) => a + b);
     }),       

      categories = documents.fold({}, (Map<String, double> map,document){

        if(!map.containsKey(document.data()['Nombre'])){
          map[document.data()['Nombre']] = 0.0;
        }

        map[document.data()['Nombre']] += document.data()['Cantidad'];
        return map;

      }),

    super(key: key);

  @override
  _VentaWidgetState createState() => _VentaWidgetState();
}

class _VentaWidgetState extends State<VentaWidget> {

   double total2 = 0;
   @override
  void initState() {
   
    super.initState();
      int currentPage2 = DateTime.now().day;
    
      int semana = 0;
      
      

      if(currentPage2 < 7)
      {

        semana = 1;
      }
      
     else if(currentPage2 <= 14)
      {
        semana = 2;
      }
      
     else if(currentPage2 <= 21)
      {
        semana = 3;
      }
      
     else if(currentPage2 > 21)
      {
        semana = 4;
      }

     
      
  print(semana);

  }
  
  
  Widget build(BuildContext context) {

    
    return Expanded(
      child: Column(
      children: <Widget>[
       _expenses(),
          _graph(),
          Container(
                color: Colors.black.withOpacity(0.3),
                height: 5.0,
              ),
          _list(),
      ],
    ),
    );
  }


    Widget _expenses() {
    return Column(
      children: <Widget>[
       

         Text("\$${widget.total.toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30.0
          ),
        ),
        Text("Total de Ventas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.white.withOpacity(0.35),
          ),
        ),
      ],
    );
  }
  
  
  // ignore: missing_return
  Widget _graph() {
    if (widget.graphType == GraphType.LINES) {
      return Container(
        height: 200.0,
        child: GraphWidget(
          data: widget.perDay,
        ),
      );
    } 
    
      if (widget.graphType == GraphType.PIE) {
      var perCategory = widget.categories.keys.map((name) => widget.categories[name] / widget.total).toList();
      return Container(
        height: 250.0,
        child: PieGraphWidget(
          data: perCategory,
        ),
      );
    }
  }
  
  Widget _item(IconData icon, String nombre, int percent,double value){
    return ListTile(
      onTap: (){

        

      
      Navigator.of(context).pushNamed('/details',
           arguments: DetailsPage1(nombre, widget.month));
      },

      leading: Icon(icon, size: 32.0,color: Colors.white,),
      title: Text(nombre,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20.0 
        ),
      ),
      subtitle: Text("$percent% de Ventas",
        style: TextStyle(
          fontSize: 16.0,
          color:Colors.white.withOpacity(0.45)
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("\$$value",
            style: TextStyle(
              color:Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
               
            ),
          ),
        )
        
        ),
      
      
      );
  }
  Widget _list() {
    return Expanded(
          child: ListView.separated(
            itemCount: widget.categories.keys.length,
            itemBuilder: (BuildContext context, int index) { 
              var key = widget.categories.keys.elementAt(index);
              var data = widget.categories[key];
              
              return _item(FontAwesomeIcons.shoppingCart, key, 100 * data ~/ widget.total, data);
              }, 
            separatorBuilder: (BuildContext context, int index){
              return Container(
                color: Colors.white.withOpacity(0.15),
                height: 8.0,
              );
            },
        ),
    );
  }


  
}


