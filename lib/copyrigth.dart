import 'package:flutter/material.dart';
import 'package:vazmen/Animation/FadeAnimation.dart';


class Copyright extends StatefulWidget {
  @override
  _CopyrightState createState() => _CopyrightState();
}

class _CopyrightState extends State<Copyright> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 350,
                
                backgroundColor: Colors.black,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/por.png'),
                      fit: BoxFit.cover
                      )
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(.2)
                          ]
                        )
                      ),

                      child: Padding(
                        padding: EdgeInsets.all(20) ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FadeAnimation(1,Text("Sappire Development", style: 
                              TextStyle(color:Colors.white,fontWeight:FontWeight.bold, fontSize: 40)
                            ,)),
                            SizedBox(height: 20,),
                            Row(
                              children: <Widget> [
                                FadeAnimation(1.2,
                                  Text("León, Guanajuato", style: TextStyle(color:Colors.grey,fontSize:16),)
                                ),
                              
                              ],
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      FadeAnimation(1.6,Text("Nuestra empresa fue creada mientras el cariño hacia popis, entonces nos marco y nos dijo, oigan jalan a hacer una app y pues dijimos que si y pues aqui seguimos chambeando y creciendo como de que no",
                      style: TextStyle(color:Colors.grey, height:1.4),
                      )),
                      SizedBox(height: 40,),
                      FadeAnimation(1.6,
                        Text("Dirección", style: TextStyle(color:Colors.white, fontSize: 18, fontWeight:FontWeight.bold),)
                      ),
                      SizedBox(height: 10,),
                      FadeAnimation(1.6,
                        Text("Casa del minecrariño alla por la plaza altacia", style: TextStyle(color:Colors.grey),)
                      ),
                      SizedBox(height: 20,),
                       FadeAnimation(1.6,
                        Text("Telefono", style: TextStyle(color:Colors.white, fontSize: 18, fontWeight:FontWeight.bold),)
                      ),
                      SizedBox(height: 10,),
                      FadeAnimation(1.6,
                        Text("4111982846", style: TextStyle(color:Colors.grey),)
                      ),
                      SizedBox(height: 10,),
                       FadeAnimation(1.6,
                        Text("Desarrolladores", style: TextStyle(color:Colors.white, fontSize: 18, fontWeight:FontWeight.bold),)
                      ),
                       SizedBox(height: 20,),
                       FadeAnimation(1.8,Container(
                         height: 200,
                         child: ListView(
                           scrollDirection: Axis.horizontal,
                           children: <Widget>[
                             makevideo(image:'assets/josue.png'),
                             makevideo(image:'assets/jose.png'),
                             makevideo(image:'assets/chris.png'),
                           ],
                         ),

                       )),

                      SizedBox(height: 120,)

                    ],
                  ))
                ]),
              )
            ]
          ),
         
        ],
      ),
    );
  }

  Widget makevideo({image}){
    return AspectRatio(
      aspectRatio: 1.5/ 1,
      child: Container(
        margin: EdgeInsets.only(right:20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit:BoxFit.cover 
          )
        ),
        child: Container(
          decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.5),
                            Colors.black.withOpacity(.2)
                          ]
                        )
                      ),
        ),
      ),
    );

  }
}