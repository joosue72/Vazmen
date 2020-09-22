
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

 class NuevoProducto extends StatefulWidget {
  NuevoProducto({Key key}) : super(key: key);

  @override
  _NuevoProductoState createState() => _NuevoProductoState();
}

TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldCalidad = TextEditingController();
TextEditingController _textFieldVariedad = TextEditingController();
final db = FirebaseFirestore.instance;
  var selectedCurrency, selectedType;
  String calidad;
  dynamic  cantidad;
  String variedad;
  DateTime now = DateTime.now();
String fecha = DateFormat('yyyy-MM-dd').format(now);
  
class _NuevoProductoState extends State<NuevoProducto> {

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getCustomAppBar(),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF202020),

    body: Stack(
        
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/inve.jpg"), fit: BoxFit.cover)
              
            ),
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
                        Text(fecha,
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          textStyle: TextStyle(color: Colors.white),
                        )
                        ),
                        IconButton(
                          icon: Icon(Icons.date_range, color: Colors.white),
                          onPressed: () {},
                        )
                      ],
                    )
                  ),
                 
                  SizedBox(height: 20.0),
                  Container(
                    width: MediaQuery.of(context).size.width - 15.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
          SizedBox(width: 10,),
                      ],
                    )
                  ),
                  SizedBox(height: 15.0),
                  
                  Container(
                    height: 500.0,
                    
                    color: Colors.black.withOpacity(0.7),
                    width: 320.0,
                    child: ListView(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                      Container(
              width: 15.0,
              child: TextFormField(
      
      keyboardType: TextInputType.number,
      controller: _textFieldVariedad,
      style: TextStyle(
        color: Colors.white,
    ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        
         
        prefixIcon: Icon(Icons.storage, color: Colors.white),
        labelText: "Variedad",
        labelStyle: TextStyle(color: Colors.white) ,
        hoverColor: Color(0xFFB71C1C),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        )),
      ),
    ),
    
            ),   
                        
          
            Container(
              width: 15.0,
              child: TextFormField(
      
      keyboardType: TextInputType.number,
      controller: _textFieldController,
      style: TextStyle(
        color: Colors.white,
    ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        
         
         prefixIcon: Icon(Icons.attach_money, color: Colors.white),
        labelText: "Cantidad",
        labelStyle: TextStyle(color: Colors.white) ,
        hoverColor: Color(0xFFB71C1C),
        border: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        )),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        )),
      ),
    ),
            ),
            SizedBox(height: 15.0,),
           
            
            
            SizedBox(height: 50.0,),
            ArgonButton(
              height: 50,
              
              roundLoadingShape: true,
              width: MediaQuery.of(context).size.width * 0.45,
              onTap: (startLoading, stopLoading, btnState) {
                if (btnState == ButtonState.Idle) {
                  startLoading();
                  if( _textFieldVariedad.text.isEmpty || _textFieldController.text.isEmpty)
                  {
                    incorrecto();
                    Future.delayed(
      
    Duration(seconds: 2),
    (){
      Navigator.of(context).pop();
    },
  );
                    
                    stopLoading();
                  }
                  else
                  {
                    correcto();

                    stopLoading();
                  }

                  
                } else {
                  stopLoading();

                }
              },
              child: Text(
                "Agregar",
                style: TextStyle(
                    color: Color(0xFF202020),
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              loader: Container(
                padding: EdgeInsets.all(10),
                child: SpinKitRotatingCircle(
                  color: Color(0xFF202020),
                  // size: loaderWidth ,
                ),
              ),
              borderRadius: 5.0,
              color: Colors.white
            ),
            
          

          
                      ],
                    )
                    
                  )
                  
                ],
              )
              
            )
          )
            
      ]
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
        Text('Agregar Nuevo Producto', style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(color: Colors.white)),),
        IconButton(icon: Icon(Icons.create, color: Colors.white), onPressed: (){}),
      ],),
    ),
  );
}

void correcto()
{
  showGeneralDialog(
      barrierLabel: "Label",
      
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: SizedBox.expand(child: Image(image: AssetImage('assets/correcto.gif'))),
            
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Color(0xFF1B1B1B),
              borderRadius: BorderRadius.circular(40),
            ),
            
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
                  Future.delayed(
                  
    Duration(seconds: 2),
    (){
      variedad = _textFieldVariedad.text.toString();
                               cantidad = double.parse(_textFieldController.text);
                               calidad = _textFieldCalidad.text.toString();
                  FirebaseFirestore.instance.collection('Inventario').doc("$variedad").set({'Variedad': '$variedad', 'Cantidad': cantidad});
                    _textFieldCalidad.text="";
  _textFieldVariedad.text="";
  _textFieldController.text="";
                  
      Navigator.of(context).pop();
    },
  );
}

void incorrecto()
{
showGeneralDialog(
      barrierLabel: "Label",
      
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            child: SizedBox.expand(child: Image(image: AssetImage('assets/error.gif'))),
            
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Color(0xFF1B1B1B),
              borderRadius: BorderRadius.circular(40),
            ),
            
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
}

  
}