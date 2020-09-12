import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


 class VentasPendientes extends StatefulWidget {
  VentasPendientes({Key key}) : super(key: key);

  @override
  _VentasPendientesState createState() => _VentasPendientesState();
}
 
 String id;
  final db = FirebaseFirestore.instance;
  String nombre;
  dynamic obtcosto;
  dynamic total;
  dynamic total2;
  String calidad, variedad;
  TextEditingController _textFieldVariedad = TextEditingController();
TextEditingController _textFieldCantidad = TextEditingController();
DateTime now = DateTime.now();
String fecha = DateFormat('yyyy-MM-dd').format(now);

class _VentasPendientesState extends State<VentasPendientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getCustomAppBar(),
      backgroundColor: Color(0xFF202020),
      
        body: Stack(
          
        
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/pendientes.jpg"), fit: BoxFit.cover)
              
            ),
          ),
          
          Container(
            
            height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
          child: ListView(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
StreamBuilder<QuerySnapshot>(
            stream: db.collection('Ventas').where("Pendiente", isEqualTo: true).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.docs.map((doc) => buildItem(doc)).toList());
              } else {
                return SizedBox();
              }
            },
          ),



          ],
          ) 
          ),
             
            ],
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
            Color(0xFF202020),
            Color(0xFF202020),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white), onPressed: (){
       Navigator.pop(context);
        }),
        Text('Ventas Pendientes', style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(color: Colors.white)),),
        IconButton(icon: Icon(Icons.timelapse, color: Colors.white), onPressed: (){}),
      ],),
    ),
  );
}


Card buildItem(DocumentSnapshot doc) {
    
    nombre = doc.data()['Nombre'];
    
    return Card(
      
      elevation: 5,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      shape: RoundedRectangleBorder(
        
      borderRadius: BorderRadius.circular(15.0),
    ),
    
    color: Colors.black.withOpacity(0.5),
      child: Padding(
        
        
        padding: const EdgeInsets.all(8.0),
        
        child: Stack(
          
          
          children: <Widget>[
            
           Container(
            height: 230.0,
            width: 400.0,
            color: Colors.black,
            
          ),
          Positioned(
            top: 8.0,
            left: 10,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: Text('Venta Pendiente',
                    style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(color: Colors.white))),
            )
            
          ),
          Positioned(
            top: 50.0,
            right: 90.0,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: Text(
              
              'Fecha: ${doc.data()['Dia']} / ${doc.data()['Mes']} / ${doc.data()['Año']} ',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  textStyle: TextStyle(
                    color: Colors.white
                  )

                )
            ),
              
            )
            
          ),
          Positioned(
            top: 70.0,
            right: 90.0,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: Text(
              'Venta: ${doc.data()['Saldo']} \$',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  textStyle: TextStyle(
                    color: Colors.white
                  )

                )
            ),
              
            )
            
          ),
          Positioned(
            top: 90.0,
            right: 90.0,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: Text(
              'Variedad: ${doc.data()['Variedad']}',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  textStyle: TextStyle(
                    color: Colors.white
                  )

                )
            ),
              
            )
            
          ),
          Positioned(
            top: 110.0,
            right: 90.0,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: Text('Kg: ${doc.data()['Cantidad']}', style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  textStyle: TextStyle(
                    color: Colors.white
                  )

                )),
              
            )
            
          ),
           
            
            SizedBox(height: 10.0),
            
            
            SizedBox(height: 12),
            Positioned(
            top: 165.0,
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
           updateData(doc);
        }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.payment, color: Color(0xFFB71C1C), size: 16.0,), // icon
            Text("Pagar", style: GoogleFonts.montserrat(
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
          _textFieldVariedad.text="";
           _editarInventario(context, doc);
        }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.attach_money, color: Color(0xFFB71C1C), size: 16.0,), // icon
            Text("Abonar", style: GoogleFonts.montserrat(
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
           
                     showAlertDialog(context, doc);
                      
                     
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
          ],
        ),
      ),
    );
  }

  void updateData(DocumentSnapshot doc) async {
    total = doc.data()['Saldo'];
    total2 = doc.data()['totalVenta'];

    total2 += total;
    await db.collection('Ventas').doc(doc.id).update({'Pendiente': false, 'totalVenta':total2, 'Saldo': 0});
  }

  void updateCantidad(DocumentSnapshot doc) async {
    total = doc.data()['Saldo'];
    total2 = doc.data()['totalVenta'];
    
    total -= obtcosto;
    total2 += obtcosto;
    await db.collection('Ventas').doc(doc.id).update({'Saldo': total, 'totalVenta':total2});
  
    
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('Ventas').doc(doc.id).delete();
    setState(() => id = null);
  }

  showAlertDialog(BuildContext context, DocumentSnapshot doc) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancelar"),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Borrar"),
    onPressed:  () {
      deleteData(doc);
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alerta!"),
    content: Text("¿Estás seguro de que quieres eliminar esta venta?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

 _editarInventario(BuildContext context, DocumentSnapshot doc) async {

  variedad = doc.data()['Variedad'];
    calidad = doc.data()['Calidad'];
    
    

    return  showDialog(child: new Dialog(
      
                child: new Stack(
                  
                  children: <Widget>[
                    

                    Container(
            height: 250.0,
            width: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.0),
              image: DecorationImage(
                image: AssetImage('assets/pendiente.jpg'),
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
              child: Text('Abonar Venta',
                    style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(color: Colors.white))),
            )
            
          ),


          

          Positioned(
            top: 80.0,
            right: 60.0,
            child: Container(
              height: 50.0,
              width: 170.0,
              child: TextField(
                      
                        decoration: new InputDecoration(hintText: "${doc.data()['Saldo']}",hintStyle: TextStyle(color: Colors.black) , fillColor: Colors.white.withOpacity(0.8), filled: true),
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
            top: 180.0,
            left: 100.0,
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
          obtcosto = double.parse(_textFieldVariedad.text);
           updateCantidad(doc);
        }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.save, color: Color(0xFFB71C1C), size: 16.0,), // icon
            Text("Abonar", style: GoogleFonts.montserrat(
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

    

}