import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vazmen/homepage.dart';
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

class _NuevoProductoState extends State<NuevoProducto> {

  TextFormField buildTextFormFieldCantidad() {
  
    return TextFormField(
      
      keyboardType: TextInputType.number,
      controller: _textFieldController,
     
      cursorColor: Colors.grey,
      decoration: InputDecoration(
         prefixIcon: Icon(Icons.storage, color: Colors.white),
        labelText: "Cantidad",
        labelStyle: TextStyle(color: Colors.white) ,
        
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
    );
  }

  TextFormField buildTextFormFieldCalidad() {
  
    return TextFormField(
      
      keyboardType: TextInputType.text,
      controller: _textFieldCalidad,
     
      cursorColor: Colors.grey,
      decoration: InputDecoration(
         prefixIcon: Icon(Icons.add_box, color: Colors.white),
        labelText: "Calidad",
        labelStyle: TextStyle(color: Colors.white) ,
        
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
    );
  }

TextFormField buildTextFormFieldVariedad() {
  
    return TextFormField(
      
      keyboardType: TextInputType.text,
      controller: _textFieldVariedad,
     
      cursorColor: Colors.white,
      decoration: InputDecoration(
         prefixIcon: Icon(Icons.add_circle, color: Colors.white),
        labelText: "Variedad",
        labelStyle: TextStyle(color: Colors.white) ,
        
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
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getCustomAppBar(),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF202020),

    body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[

          SizedBox(height: 50.0),
          Form(
            child: buildTextFormFieldCalidad(),
          ),
          SizedBox(height: 30.0,),
          Form(
            child: buildTextFormFieldVariedad(),
          ),
          SizedBox(height: 30.0,),
          Form(
            child: buildTextFormFieldCantidad(),
          ),
          SizedBox(height: 50.0,),
           ArgonButton(
              height: 50,
              
              roundLoadingShape: true,
              width: MediaQuery.of(context).size.width * 0.45,
              onTap: (startLoading, stopLoading, btnState) {
                if (btnState == ButtonState.Idle) {
                  startLoading();
                  variedad = _textFieldVariedad.text.toString();
                               cantidad = double.parse(_textFieldController.text);
                               calidad = _textFieldCalidad.text.toString();
                  FirebaseFirestore.instance.collection('Inventario').doc("$variedad").set({'Variedad': '$variedad', 'Cantidad': cantidad, 'Calidad': '$calidad'});
                  
                  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
                } else {
                  stopLoading();
                  
                }
              },
              child: Text(
                "Registrar",
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
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );

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

  
}