import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vazmen/homepage.dart';
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

    return Scaffold(
      
      body: Container(
    
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xFF202020),
                Color(0xFF202025)
            ]
          )
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(1,Text("Login", style: TextStyle(color:Colors.white,fontSize: 50),)),
                  SizedBox(height: 10,),
                  FadeAnimation(2,Text("Bienvenido de nuevo", style: TextStyle(color:Colors.white,fontSize: 18),))
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(60), topRight:Radius.circular(60))
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    
                    children: <Widget>[
                      SizedBox(height: 60,),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                            color: Color.fromRGBO(153, 153, 153,153),
                            blurRadius: 20,
                            offset: Offset(0,10)
                          )]
                        ),
                        child: Column(
                          children: <Widget>[
                           FadeAnimation(3, Container(
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: FadeAnimation(3,TextField(
                                decoration: InputDecoration(
                                  hintText: "Introduce tu contraseña",
                                  hintStyle: TextStyle(color:Colors.grey),
                                  border: InputBorder.none
                                ),
                              )),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(height: 40,),

                   
                      SizedBox(height: 20,),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal:50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[900]
                        ),
                        child: Center(
                      child: FadeAnimation(4,RaisedButton(
                              color: Colors.grey[900],
                             child: Text("Login", style: TextStyle(color: Colors.white),),
                             onPressed: (){

                               Route route = MaterialPageRoute(builder: (bc) => HomePage());
                                                Navigator.of(context).push(route);
                            
                             },
                      ))

                    ),
                      )

                    ],
                  )),
              ),
            )
         
          ],
        ),
      )
            
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
      color: Color(0xFF202020),
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
    child: Image(image: AssetImage('assets/1100.png'),
    fit: BoxFit.cover,
    ),
    );

  }

  Widget _textos(){
    
 

    
     
    

    return SafeArea(
          child: Column(
        
        children:<Widget> [
          SizedBox(height: 20.0),
        //  Text(currentPage.toString(), style: estiloTexto),
      //    Text(dia, style: estiloTexto,),
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
