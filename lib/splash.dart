import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Animation/FadeAnimation.dart';
import 'dashboard.dart';
import 'homepage.dart';

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
      backgroundColor: Color.fromRGBO(108, 192, 218, 1),
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
                          image: AssetImage('assets/background-2.png'),
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
                          blurRadius: 30,
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
                              hintStyle: TextStyle(color: Colors.black)
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                  SizedBox(height: 50,),
                  
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
                             //  Navigator.push(context,PageRouteBuilder(
                              //   transitionDuration: Duration(seconds: 1),
                              //transitionsBuilder: (BuildContext context, Animation<double> animation,Animation<double> secAnimation, Widget child)
                              //   {
                                //   animation = CurvedAnimation(parent: animation,curve: Curves.elasticInOut);
                                  //  return ScaleTransition(
                                    //  alignment: Alignment.center,
                                      //scale: animation,
                                     // child: child,
                                   // );
                                // },
                                 //pageBuilder: (BuildContext context, Animation<double> animation,Animation<double> secAnimation)
                              // {
                               //  return ProductList();
                              // }
                              // ));
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

  void validarLogin(BuildContext context)
{

Route route = MaterialPageRoute(builder: (bc) => HomePage());
                                                Navigator.of(context).push(route);
}

  Widget _imagenFondo(){

    return Container(
      width: double.infinity,
      height: double.infinity,
    child: Image(image: AssetImage('assets/scroll-1.png'),
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



class ProductList extends StatelessWidget {
   var selectedItem = 0;

  List children = [
    DashboardPage(),
    DashboardPage(),
    DashboardPage(),
    DashboardPage()
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    assert(!_debugLocked);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF202020),
      body: children[selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1B1B1B),
        selectedItemColor: Color(0xFFB71C1C),
        iconSize: 27.0,
        currentIndex: selectedItem,
        unselectedLabelStyle: TextStyle(color: Color(0xFF1B1B1B)),
        unselectedItemColor: Color(0xFF888888),
        onTap: (currIndex) {
        
        },
        items: [ 
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Icon(Icons.home),
            title: Container(
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB71C1C) 
              ),
            )
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Icon(Icons.search),
            title: Container(
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB71C1C) 
              ),
            )
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Icon(Icons.camera_alt),
            title: Container(
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB71C1C) 
              ),
            )
          ),
          BottomNavigationBarItem(
            backgroundColor: Color(0xFF1B1B1B),
            icon: Icon(Icons.person_outline),
            title: Container(
              height: 5.0,
              width: 5.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFB71C1C) 
              ),
            )
          )
        ],
      ),
    );
  }
}

bool _debugLocked = false;
