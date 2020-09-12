import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vazmen/NuevoProducto.dart';
import 'package:vazmen/VentasPendientes.dart';
import 'package:vazmen/homepage.dart';
import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';



 class Ventas extends StatefulWidget {
  
  final imgPath, title;

  Ventas({this.imgPath, this.title}); 

  @override
  _VentasState createState() => _VentasState();
}
final db = FirebaseFirestore.instance;
DateTime now = DateTime.now();
String fecha = DateFormat('yyyy-MM-dd').format(now);
TextEditingController _textFieldController = TextEditingController();
TextEditingController _textFieldCantidad = TextEditingController();
dynamic cantidad, total = 0;
dynamic saldo;
dynamic cantidadInventario;
String productoInventario;
int cont;
class _VentasState extends State<Ventas> {

 bool pendiente;
  
  @override
  void initState() {
    pendiente = Global.shared.pendiente;
    super.initState();
    
  }


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
                    child: Icon(Icons.shopping_cart, color: Colors.white),
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
                    
                    
                    width: 320.0,
                    child: ListView(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        
                        Form(
            child:  ListView(
              scrollDirection: Axis.vertical,
    shrinkWrap: true,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_shopping_cart, color: Colors.white),
                    SizedBox(width: 50.0,),
                     StreamBuilder<QuerySnapshot>(
                       
                  stream: db.collection('Inventario').snapshots(),
                  
                  builder: (context, snapshot) {
                    
                    if (!snapshot.hasData)

                      const Text("Loading.....");
                    else {
                      List<DropdownMenuItem> currencyItems = [];
                      for (int i = 0; i < snapshot.data.docs.length; i++) {
                        DocumentSnapshot snap = snapshot.data.docs[i];
                        currencyItems.add(
                          DropdownMenuItem(
                            
                            child: Text(
                              
                              snap.reference.id,
                              style: TextStyle(color: Colors.white),
                              
                            ),
                            value: "${snap.id}",
                          ),
                        );
                      }return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          
                          
                          DropdownButton(
                            
                            items: currencyItems,
                            onChanged: (currencyValue) {
                              final snackBar = SnackBar(
                                backgroundColor: Colors.black,
                                content: Text(
                                  'Variedad: $currencyValue',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                              setState(() {
                                selectedCurrency = currencyValue;
                              });
                            },
                            value: selectedCurrency,
                            isExpanded: false,
                            hint: new Text(
                              "Seleccione Variedad",
                              style: TextStyle(color: Colors.white),
                            ),
                            dropdownColor: Colors.black,
                            icon: Icon(Icons.arrow_drop_down, color: Colors.white, size: 22.0,),
                          ),
                        ],
                      );
                    }
                  }),
                  
                  SizedBox(width: 10.0,),
                   
                  SizedBox(width: 10.0,),
                  ],
                  
                ),
                
              ],
            ),
          ),
          SizedBox(height: 15.0,),
          
            Container(
              width: 15.0,
              child: TextFormField(
      onChanged: (_textFieldController){
        cantidad=double.parse(_textFieldCantidad.text);
        total=double.parse(_textFieldController);
        total*=cantidad;
      },
      keyboardType: TextInputType.number,
      controller: _textFieldController,
      style: TextStyle(
        color: Colors.white,
    ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        
         
         prefixIcon: Icon(Icons.attach_money, color: Colors.white),
        labelText: "Costo por papa",
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
            Container(
              width: 15.0,
              child: TextFormField(
      onChanged: (_textFieldCantidad){
        cantidad=double.parse(_textFieldCantidad);
        total=double.parse(_textFieldController.text);
        total*=cantidad;
        
      },
      keyboardType: TextInputType.number,
      controller: _textFieldCantidad,
      style: TextStyle(
        color: Colors.white,
    ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        
         
        prefixIcon: Icon(Icons.storage, color: Colors.white),
        labelText: "Cantidad de Papas",
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
            SizedBox(height: 25.0,),
            Container(
              width: 15.0,
              child: LiteRollingSwitch(
    //initial value
     
    value: false,
    textOn: 'Pagado',
    textOff: 'Pendiente',
    colorOn: Color(0xFF353535),
    colorOff: Colors.redAccent[700],
    iconOn: Icons.done,
    iconOff: Icons.remove_circle_outline,
    textSize: 16.0,
    
    onChanged: (bool isOn) {
      
            pendiente = isOn;
             Global.shared.pendiente = isOn;
             isOn = isOn;
        print(isOn); 
    },
    
    
), 
    
            ),
            SizedBox(height: 40.0,),
            Container(
              
              
              
              child: Text("Total: "+total.toString()+" \$",
                        style: GoogleFonts.montserrat(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(color: Colors.white))),
            ),
            SizedBox(height: 50.0,),
            ArgonButton(
              height: 50,
              
              roundLoadingShape: true,
              width: MediaQuery.of(context).size.width * 0.45,
              onTap: (startLoading, stopLoading, btnState) {
                if (btnState == ButtonState.Idle) {
                  startLoading();
                  if( _textFieldCantidad.text.isEmpty || _textFieldController.text.isEmpty)
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
                    actualizarInventario();
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
        ],
      ),
      
     floatingActionButton: FloatingActionButton(child: Icon(Icons.watch_later), backgroundColor: Color(0xFF202020),
     onPressed: (){
        Route route = MaterialPageRoute(builder: (bc) => VentasPendientes());
                               Navigator.of(context).push(route);
     },
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
      DateTime now = DateTime.now();
      String formatter = DateFormat('yyyy').format(now);
      String mes = DateFormat('MMM').format(now);
      String dia = DateFormat('d').format(now);
      int numerofecha;
       switch(mes)
      {
        case 'Jan':
            numerofecha = 1;
        break;
        case 'Feb':
            numerofecha = 2;
        break;
        case 'Mar':
            numerofecha = 3;
        break;
        case 'Apr':
            numerofecha = 4;
        break;
        case 'May':
            numerofecha = 5;
        break;
        case 'Jun':
            numerofecha = 6;
        break;
        case 'Jul':
            numerofecha = 7;
        break;
        case 'Aug':
            numerofecha = 8;
        break;
        case 'Sep':
            numerofecha = 9;
        break;
        case 'Oct':
            numerofecha = 10;
        break;
        case 'Nov':
            numerofecha = 11;
        break;
        case 'Dec':
            numerofecha = 12;
        break;
      }
      if(pendiente == false)
      {
        pendiente = true;
        saldo = total;
        print(saldo);
        cantidad = double.parse(_textFieldController.text);
                               
                  FirebaseFirestore.instance.collection('Ventas').add({'Pendiente':pendiente,'Cantidad': cantidad, 'Variedad': '$selectedCurrency', 'totalVenta': total=0,'Saldo':saldo,'Mes':numerofecha,'Dia':int.parse(dia),'Año':int.parse(formatter)});
                   _textFieldCantidad.text="";
  _textFieldController.text="";
      pendiente=false;   
      }
      else {
        pendiente = false;
        cantidad = double.parse(_textFieldController.text);
                               
                  FirebaseFirestore.instance.collection('Ventas').add({'Pendiente':pendiente,'Cantidad': cantidad, 'Variedad': '$selectedCurrency', 'totalVenta': total,'Mes':numerofecha,'Dia':int.parse(dia),'Año':int.parse(formatter)});
                    
  _textFieldCantidad.text="";
  _textFieldController.text="";
  total=0; 
  pendiente=true;
      }
                              
                               
  print(total);               
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
 void actualizarInventario() async
 {
   cont = 0;
   db
      .collection("Inventario")
      .where("Variedad", isEqualTo: selectedCurrency)
      .snapshots()
      .listen((result) {
    result.docs.forEach((result) {
      productoInventario = result.data()['Cantidad'].toString();
      cantidadInventario = double.parse(productoInventario);
   if(pendiente==true)
   {
     cantidadInventario -= cantidad;
     cont++;
     if(cont == 1)
     {
         db.collection('Inventario').doc('$selectedCurrency').update({'Cantidad': cantidadInventario});
     }
   }
   else
   {
    cantidadInventario -= cantidad;
     cont++;
     if(cont == 1)
     {
         db.collection('Inventario').doc('$selectedCurrency').update({'Cantidad': cantidadInventario});
     }
   }
    });
  });
  
 }
}

class Global{
  static final shared =Global();
  bool pendiente = false;
}