

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
  var  _currentSelectedValue;
 var _currencies = [
    "1ra",
    "2nda",
    "3ra",
    "4ta",
    "Cambray",
    "Monos",
    "Gordas"
  ];
class _NuevoProductoState extends State<NuevoProducto> {

  TextFormField buildTextFormFieldCantidad() {
  
    return TextFormField(
      
      keyboardType: TextInputType.number,
      controller: _textFieldController,
      style: TextStyle(
        color: Colors.white,
    ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        
         
         prefixIcon: Icon(Icons.storage, color: Colors.white),
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
    );
  }

  TextFormField buildTextFormFieldCalidad() {
  
    return TextFormField(
      
      keyboardType: TextInputType.text,
      controller: _textFieldCalidad,
     style: TextStyle(
        color: Colors.white,
    ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
         prefixIcon: Icon(Icons.add_box, color: Color(0xFFB71C1C)),
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
     style: TextStyle(
        color: Colors.white,
    ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
         prefixIcon: Icon(Icons.add_circle, color: Colors.white),
        labelText: "Variedad",
        labelStyle: TextStyle(color: Colors.white) ,
        fillColor: Colors.white,
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
              padding: EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
          
          Container(
            color: Color(0xFF000000).withOpacity(0.5),
            height: 500.0,
                    width: MediaQuery.of(context).size.width,
          child: ListView(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        SizedBox(height: 20.0,),
                        Form(child: buildTextFormFieldVariedad(),),
                        SizedBox(height: 20.0,),
                      

 FormField<String>(

    

          builder: (FormFieldState<String> state) {
           
            return InputDecorator(
              
              decoration: InputDecoration(

                  labelStyle: TextStyle(color: Colors.white),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  hintText: 'Seleccione calidad',
                  hintStyle: TextStyle(color: Colors.black, backgroundColor: Colors.white),
                  prefixStyle: TextStyle(color: Colors.white),
                  
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0), borderSide: BorderSide(color: Colors.white),)),
              isEmpty: _currentSelectedValue == '',
              
              child: DropdownButtonHideUnderline(
                
                child: DropdownButton<String>(
                  dropdownColor: Colors.black,
                  icon: Icon(Icons.arrow_drop_down_circle, color: Colors.white),
                  focusColor: Colors.white,
                  value: _currentSelectedValue,
                  isDense: true,
                  onChanged: (String newValue) {
                    setState(() {
                      _currentSelectedValue = newValue;
                      state.didChange(newValue);
                    });
                  },
                  items: _currencies.map((String value) {
                    
                    return DropdownMenuItem<String>(
                      
                      value: value,
                      child: Text(value,
                      style: TextStyle(color: Colors.white),
                      
                      ),
                      
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
                        SizedBox(height: 20.0,),
                        Form(child: buildTextFormFieldCantidad(),),
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
          ),
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
                  FirebaseFirestore.instance.collection('Inventario').doc("$variedad").set({'Variedad': '$variedad', 'Cantidad': cantidad, 'Calidad': '$_currentSelectedValue'});
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