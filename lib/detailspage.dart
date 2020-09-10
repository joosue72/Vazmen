import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vazmen/NuevoProducto.dart';
import 'package:vazmen/homepage.dart';




  class DetailsPage extends StatefulWidget {
   
 
   final imgPath, title;

  DetailsPage({this.imgPath, this.title}); 

   @override
   _DetailsPageState createState() => _DetailsPageState();
 }
 
final db = FirebaseFirestore.instance;
String id;
String nombre;
String calidad, variedad;
String obtVariedad;
dynamic cantidad, obtCantidad;
  String documentId;
  DateTime now = DateTime.now();
String hora = DateFormat('yyyy-MM-dd').format(now);
String fecha = DateFormat('kk:mm').format(now);

TextEditingController _textFieldVariedad = TextEditingController();
TextEditingController _textFieldCantidad = TextEditingController();

 

 class _DetailsPageState extends State<DetailsPage> {

   

   @override
   Widget build(BuildContext context) {



     return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imgPath), fit: BoxFit.cover)
              
            ),
          ),
          BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color:Color(0xFF353535)
                  ),
                  child: Center(
                    child: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: ()
                    {
                         Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
    
  );
                    }),
                    
                  )
                  
                ),
                Text(widget.title.toString().toUpperCase(),
                style: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  textStyle: TextStyle(color: Colors.white)
                )
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Color(0xFF353535)),
                  child: Center(
                    child: Icon(Icons.bookmark_border, color: Colors.white),
                  ),
                ),
              ],
            )
          ),
          Positioned(
            top: 100.0,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 15.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('VazMen Central De Abastos',
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.white),
                        )
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () {},
                        )
                      ],
                    )
                  ),
                  SizedBox(height: 10.0),
                  Text(hora,
                        style: GoogleFonts.montserrat(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.white),
                        )
                        ),
                  SizedBox(height: 20.0),
                  Container(
                    width: MediaQuery.of(context).size.width - 15.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
          SizedBox(width: 20,),
                      ],
                    )
                  ),
                  SizedBox(height: 15.0),
                  
                  Container(
                    height: 500.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        StreamBuilder<QuerySnapshot>(
            stream: db.collection('Inventario').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.docs.map<Widget>((doc) => _buildListItem(doc)).toList());
                
              } else {
                return SizedBox();
              }
            },
          ),
            

          
                      ],
                    )
                    
                  )
                  
                ],
              )
              
            )
          )
        ],
      ),
      
     floatingActionButton: FloatingActionButton(child: Icon(Icons.add), backgroundColor: Color(0xFF202020),
     onPressed: (){
        Route route = MaterialPageRoute(builder: (bc) => NuevoProducto());
                               Navigator.of(context).push(route);
     },
     ),
    );
   }

   _buildListItem(DocumentSnapshot doc) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            height: 175.0,
            width: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              image: DecorationImage(
                image: AssetImage('assets/papa.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
              )
            )
          ),
          Positioned(
            top: 15.0,
            right: 15.0,
            child: Container(
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white
              ),
              child: Center(
                
                child: IconButton(
                  alignment: Alignment.center,
  icon: new Icon(Icons.add_shopping_cart, color: Color(0xFFB71C1C), size: 16.0,),
  onPressed: () { _editarInventario(context, doc); },
  
)

                
              )
              
            )
            
          ),
          Positioned(
            top: 120.0,
            left: 15.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${doc.data()['Variedad']}",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  textStyle: TextStyle(
                    color: Colors.white
                  )
                )
                ),
                Text("${doc.data()['Cantidad']} kg",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.0,
                  textStyle: TextStyle(
                    color: Colors.white
                  )
                )
                )
              ],
              
            )
            
          ),
          Positioned(
            top: 120.0,
            right: 15.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${doc.data()['Calidad']}",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  textStyle: TextStyle(
                    color: Colors.white
                  )
                )
                ),
                
              ],
              
            )
            
          )
          
        ]
        
      )
      
    );
    
  }

   _editarInventario(BuildContext context, DocumentSnapshot doc) async {

  variedad = doc.data()['Variedad'];
    calidad = doc.data()['Calidad'];
    
    

    return  showDialog(child: new Dialog(
      
                child: new Stack(
                  
                  children: <Widget>[
                    

                    Container(
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              image: DecorationImage(
                image: AssetImage('assets/papa.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)
              )
            )
          ),
          Positioned(
            top: 8.0,
            right: 50,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: Text('Editar Inventario',
                    style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(color: Colors.white))),
            )
            
          ),


          Positioned(
            top: 140.0,
            right: 60.0,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: TextField(
                
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(hintText: "${doc.data()['Cantidad']}",hintStyle: TextStyle(color: Colors.black) , fillColor: Colors.white.withOpacity(0.8), filled: true, suffixText: "Kg"),
                        controller: _textFieldCantidad,
                        style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  textStyle: TextStyle(
                    color: Colors.black
                  )

                )
                    
                    ),
              
            )
            
          ),

          Positioned(
            top: 80.0,
            right: 60.0,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: TextField(
                      
                        decoration: new InputDecoration(hintText: "${doc.data()['Variedad']}",hintStyle: TextStyle(color: Colors.black) , fillColor: Colors.white.withOpacity(0.8), filled: true),
                        controller: _textFieldVariedad,
                        style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  textStyle: TextStyle(
                    color: Colors.black
                  )

                )
                    
                    ),
              
            )
            
          ),
          
                

                    
                     
                   
              
          Positioned(
            top: 230.0,
            left: 50.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Row(
                      mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox.fromSize(
  size: Size(100, 50), // button width and height
  child: ClipRRect(
    child: Material(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
      color: Color(0xFF202020), // button color
      child: InkWell(
        splashColor: Colors.blue, // splash color
        onTap:  () {
           obtCantidad = double.parse(_textFieldCantidad.text);
                      obtVariedad = _textFieldVariedad.text;   
                      FirebaseFirestore.instance.collection('Inventario').doc("$obtVariedad").set({'Variedad': '$obtVariedad', 'Cantidad': obtCantidad});
                      Navigator.pop(context);
                      _textFieldCantidad.text="";
                      _textFieldVariedad.text="";
        }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.save, color: Color(0xFFB71C1C), size: 16.0,), // icon
            Text("Guardar", style: GoogleFonts.montserrat(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.white),
                        )), // text
          ],
        ),
      ),
    ),
  ),
),
                SizedBox(width: 8),
SizedBox.fromSize(
  size: Size(100, 50), // button width and height
  child: ClipRRect(
    child: Material(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
      color: Color(0xFF202020), // button color
      child: InkWell(
        splashColor: Colors.blue, // splash color
        onTap:  () {
           obtCantidad = double.parse(_textFieldCantidad.text);
                     deleteData(doc);
                      Navigator.pop(context);
                      _textFieldCantidad.text="";
                      _textFieldVariedad.text="";
        }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.delete_forever, color: Color(0xFFB71C1C), size: 16.0,), // icon
            Text("Borrar", style: GoogleFonts.montserrat(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.white),
                        )), // text
          ],
        ),
      ),
    ),
  ),
),
                SizedBox(width: 15),
                ],
                    ),
              ],
              
            )
            
          ),
                    
                    
                    
                    SizedBox(height: 15),
                  ],
                ),

              ), context: context);
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('Inventario').doc(doc.id).delete();
    setState(() => id = null);
  }
  
  
 }