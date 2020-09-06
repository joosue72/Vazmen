import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vazmen/homepage.dart';

import 'Animation/FadeAnimation.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical  ,
        children: <Widget>[
          _pagina1(),
          _pagina2(context),
        ],
      )
    );
  }



  Widget _pagina2(BuildContext context) {

  
    
    SystemChrome.setEnabledSystemUIOverlays([]);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF009688),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 400,
              child: Stack(
                children: <Widget>[
                  
                  Positioned(
                    height: 400,
                    width: width+10,
                    child: FadeAnimation(1.3, Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bsl.png'),
                          fit: BoxFit.fill
                        )
                      ),
                    )),
                  ),
                  Positioned(
                    height: 300,
                    width: width+10,
                    child: FadeAnimation(1.3, Container(
                      decoration: BoxDecoration(
                        
                        image: DecorationImage(
                          
                          image: AssetImage('assets/pp.png')
                          
                        )
                      ),
                    )),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1.5, Text("Inicio De Sesión", style: TextStyle(color: Color.fromRGBO(0, 0, 0, 100), fontWeight: FontWeight.bold, fontSize: 30),)),
                  SizedBox(height: 30,),
                  FadeAnimation(1.7, Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 100),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                  
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            onSubmitted: (myController)
                            {
                           //   validarLogin(context);
                            },
                            obscureText: true,
                          // controller: myController,
                            decoration: InputDecoration(
                              
                              border: InputBorder.none,
                              hintText: "Contraseña",
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                  SizedBox(height: 20,),
                  
                  FadeAnimation(1.9, Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: RaisedButton(
                              color: Colors.black,
                             child: Text("Login", style: TextStyle(color: Colors.white),),
                             onPressed: (){
                              Route route = MaterialPageRoute(builder: (bc) => HomePage());
                                                Navigator.of(context).push(route);
                             },
                      )

                    ),

                  )
                  
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  
   
  }
  Widget _pagina1() {

    
     return Stack(
       children: <Widget>[
         _colorFonto(),
         _imagenFondo(),
         _textos(),
       ],
     );

  }

  Widget _colorFonto(){

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1),
    );


  }

  Widget _imagenFondo(){

    return Container(
      width: double.infinity,
      height: double.infinity,
    child: Image(image: AssetImage('assets/1100.png'),
    fit: BoxFit.cover,
    ),
    );

  }

  Widget _textos(){
    final estiloTexto = TextStyle(color: Colors.white,fontSize:50);
    int currentPage = DateTime.now().day;
    int currentPage2 = DateTime.now().weekday;
    String dia;

    switch(currentPage.toString())
      {
        case '1':
            dia =  "Lunes";
        break;
        case '2':
            dia =  "Martes";
        break;
        case '3':
            dia =  "Miercoles";
        break;
        case '4':
            dia =  "Jueves";
        break;
        case '5':
            dia =  "Viernes";
        break;
        case '6':
            dia =  "Sabado";
        break;
        case '7':
            dia =  "Domingo";
        break;
      }
     
    

    return SafeArea(
          child: Column(
        
        children:<Widget> [
          SizedBox(height: 20.0),
          Text(currentPage.toString(), style: estiloTexto),
          Text(dia, style: estiloTexto,),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
        ],
      ),
    );
  }

}