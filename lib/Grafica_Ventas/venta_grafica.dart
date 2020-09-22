
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vazmen/Animation/FadeAnimation.dart';
import '../Ventas.dart';
import '../homepage.dart';
import 'venta_widget.dart';

class venta_grafica extends StatefulWidget {
 
  
   final imgPath, title;

  venta_grafica({this.imgPath, this.title}); 
  

  @override
  _venta_graficaState createState() => _venta_graficaState();
}


class _venta_graficaState extends State<venta_grafica> {
  

   PageController _controller;
  int currentPage = DateTime.now().month - 1;
  int currentPage2 = DateTime.now().day;
  Stream<QuerySnapshot> _query;
  GraphType currentType = GraphType.LINES;
  

  @override
  void initState() {
    super.initState();

    _query = FirebaseFirestore.instance

        .collection('Ventas')
        .where("Mes", isEqualTo: currentPage + 1)
        .snapshots();

    _controller = PageController(
      initialPage: currentPage,
      viewportFraction: 0.4,
    );
  }

  Widget _bottomAction(IconData icon, Function callback) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: callback,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(currentPage2);
    return Scaffold(
    appBar: _getCustomAppBar(),
backgroundColor: Color(0xFF1B1B1B),



     
      bottomNavigationBar: BottomAppBar(
          notchMargin: 8.0,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _bottomAction(FontAwesomeIcons.chartLine, () {
                setState(() {
                  
                  currentType = GraphType.LINES;
                });
              }),
              SizedBox(width: 48.0),
             _bottomAction(FontAwesomeIcons.chartPie, () {
                setState(() {
                  currentType = GraphType.PIE;
                });
              }),
            ],
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.add,color: Colors.black,),
        backgroundColor: Colors.white,
        onPressed: () {
          
             Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));

          
        },
      ),
      body: FadeAnimation(2.5,_body()),

      
    );
  }

  Widget _body() {
    return SafeArea(
      
      child: Column(
        
     
        children: <Widget>[
       
           Form(
          
            
                      child: new Container(
              child: new Row(

                children: <Widget>[

               

            



                ],
              ),

              
            ),
                   
          ),
         FadeAnimation(1.3, _selector()),
          StreamBuilder<QuerySnapshot>(
            stream: _query,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> data) {
              if (data.hasData) {

                

                // ignore: dead_code
                return VentaWidget(

                  
                  
                  documents: data.data.docs,
                  graphType: currentType,
                  month: currentPage,
                );

              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _pageItem(String name, int position) {
    var _alignment;
    final selected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    final unselected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.white.withOpacity(0.4),
    );

    if (position == currentPage) {
      _alignment = Alignment.center;
    } else if (position > currentPage) {
      _alignment = Alignment.centerRight;
    } else {
      _alignment = Alignment.centerLeft;
    }

    return Align(
      alignment: _alignment,
      child: Text(name,
        style: position == currentPage ? selected : unselected,
      ),
    );
  }

  Widget _selector() {
    return SizedBox.fromSize(
      size: Size.fromHeight(70.0),
      child: PageView(
        onPageChanged: (newPage) {
          setState(() {
            currentPage = newPage;
            _query = FirebaseFirestore.instance
                .collection('Ventas')
                .where("Mes", isEqualTo: currentPage + 1)
                .snapshots();
          });
        },
        controller: _controller,
        children: <Widget>[
          _pageItem("Enero", 0),
          _pageItem("Febrero", 1),
          _pageItem("Marzo", 2),
          _pageItem("Abril", 3),
          _pageItem("Mayo", 4),
          _pageItem("Junio", 5),
          _pageItem("Julio", 6),
          _pageItem("Agosto", 7),
          _pageItem("Septiembre", 8),
          _pageItem("Octubre", 9),
          _pageItem("Noviembre", 10),
          _pageItem("Diciembre", 11),
        ],
      ),
    );
  }
  _getCustomAppBar(){
  return PreferredSize(
    preferredSize: Size.fromHeight(50),
    child: Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
      color: Color(0xFF1B1B1B),
      ),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
       FadeAnimation(1, IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white), onPressed: (){
                Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

        })),
        FadeAnimation(1,Text('Lista Ventas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500,color: Colors.white),)),
        FadeAnimation(1,IconButton(icon: Icon(Icons.trending_up,color: Colors.white), onPressed: (){
          Route route = MaterialPageRoute(builder: (bc) => HomePage());
                                                Navigator.of(context).push(route);
        })),
      ],),
    ),
  );
}
}