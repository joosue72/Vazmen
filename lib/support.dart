import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Animation/FadeAnimation.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

 void _launchUrl(String url) async{
    if(await canLaunch(url))
    {
      await launch(url);
    }
    else{
      throw 'No se pudo abrir';
    }
  }

  void _launchCaller(int number) async{
    var url = "tel:${number.toString()}";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'No se pudo abrir';
    }
  }

  void _launcherEmail(String emailId) async{
    var url = "mailto:$emailId?subject=Necesito Ayuda";
     if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw 'No se pudo abrir';
    }
  }

class _SupportState extends State<Support> {

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: SingleChildScrollView(
        
        child: Container(
          
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: <Widget>[
              
              Row(
                
                children: <Widget>[
                   FadeAnimation(1,
                  Image.asset("assets/por.png", height: 120)),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                  
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      FadeAnimation(2,   Text(
                          "Sapphire Help",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        )),
                        FadeAnimation(3, Text(
                          "Menu de ayuda",
                          style: TextStyle(fontSize: 19, color: Colors.grey),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                             FadeAnimation(4,
                            IconTile(
                              backColor: Color(0xffFFECDD),
                              imgAssetPath: "assets/email.png",
                            )),
                             FadeAnimation(4,
                            IconTile2(
                              backColor: Color(0xffFEF2F0),
                              imgAssetPath: "assets/call.png",
                            )),
                             FadeAnimation(4,
                            IconTile3(
                              
                              
                              backColor: Color(0xffEBECEF),
                              imgAssetPath: "assets/video_call.png",
                             
                            ),),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
               FadeAnimation(4.5,
              Text(
                "Acerca de",
                style: TextStyle(fontSize: 22, color: Colors.white),
              )),
              SizedBox(
                height: 16,
              ),
               FadeAnimation(4.5,
              Text(
                "En Sapphire nos enfocamos en mantener el mejor servicio posible, es por eso que en esta ventana puedes reportar cualquier fallo que encuentres en la aplicación",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              )),
              SizedBox(
                height: 70,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                     
                      SizedBox(
                        height: 20,
                      ),
                    
                    ],
                  ),
                 
                ],
              ),
             
              SizedBox(
                height: 22,
              ),
               SizedBox(height: 20,),
                FadeAnimation(5,
              Text("Desarrolladores", style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),)),
              SizedBox(height: 20,),
               FadeAnimation(5.2,
              Developers()),
               SizedBox(height: 20,),
                FadeAnimation(5.3,
               Developers2()),
                SizedBox(height: 20,),
                 FadeAnimation(5.4,
                Developers3()),
                  SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
     _launcherEmail('gumencode@gmail.com');
      },
      
      child: Container(
      margin: EdgeInsets.only(right: 16),  
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          
          imgAssetPath,
          width: 20,
        ),
        
        
      ),
      
    );
    
  }
}

class IconTile2 extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile2({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _launchCaller(4771762014);
      },
      
      child: Container(
      margin: EdgeInsets.only(right: 16),  
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          
          imgAssetPath,
          width: 20,
        ),
        
        
      ),
      
    );
    
  }
}

class IconTile3 extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile3({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _launchUrl('https://goo.gl/maps/gxCYAhoBz7taY3rZA');
      },
      
      child: Container(
      margin: EdgeInsets.only(right: 16),  
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          
          imgAssetPath,
          width: 20,
        ),
        
        
      ),
      
    );
    
  }
}




class Developers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: (){
        _launchCaller(4771762014);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[600],
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.symmetric(horizontal: 24,
        vertical: 18),
        child: Row(
          children: <Widget>[
             CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/jose.png')
            ),
            SizedBox(width: 17,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("José Mena Salas", style: TextStyle(
                   color: Colors.white,
                  fontSize: 19
                ),),
                SizedBox(height: 2,),
                Text("Desarrollador Movil", style: TextStyle(
                   color: Colors.grey,
                  fontSize: 15
                ),)
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,
              vertical: 9),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(13)
              ),
              child: Text("Call", style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    ); 
  }
}


class Developers2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _launchCaller(4774958375);
      },
      child: Container(
        decoration: BoxDecoration(
           color: Colors.grey[600],
          borderRadius: BorderRadius.circular(20)
        ),
        padding: EdgeInsets.symmetric(horizontal: 24,
        vertical: 18),
        child: Row(
          children: <Widget>[
              CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/chris.png')
            ),
            SizedBox(width: 17,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Christian Ramirez", style: TextStyle(
                   color: Colors.white,
                  fontSize: 19
                ),),
                SizedBox(height: 2,),
                Text("Desarrollador Web", style: TextStyle(
                   color: Colors.grey,
                  fontSize: 15
                ),)
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,
              vertical: 9),
              decoration: BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.circular(13)
              ),
              child: Text("Call", style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    ); 
  }
}


class Developers3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _launchCaller(4111982816);
      },
      child: Container(
        decoration: BoxDecoration(
           color: Colors.grey[600],
          borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.symmetric(horizontal: 24,
        vertical: 18),
        child: Row(
          children: <Widget>[
          CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/josue.png')
            ),
            SizedBox(width: 17,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Josué Romo", style: TextStyle(
                   color: Colors.white,
                  fontSize: 19
                ),),
                SizedBox(height: 2,),
                Text("Desarrollador Movil", style: TextStyle(
                   color: Colors.grey[400],
                  fontSize: 15
                ),)
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,
              vertical: 9),
              decoration: BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.circular(13)
              ),
              child: Text("Call", style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    ); 
  }
}
