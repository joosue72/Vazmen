import 'package:flutter/material.dart';
import 'package:vazmen/copyrigth.dart';
import 'package:vazmen/dashboard.dart';
import 'package:flutter/services.dart';
import 'package:vazmen/splash.dart';
import 'package:vazmen/support.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool _debugLocked = false;


class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
          setState(() {
            selectedItem = currIndex;
            switch(currIndex) {
    case 1:
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Copyright()),
  );
      break;
 case 2:
     Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Support()),
  );
      break;
    case 3:
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ScrollPage()),
  );
      break;
  }
          });
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
            icon: Icon(Icons.copyright),
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
            icon: Icon(Icons.device_unknown),
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
            icon: Icon(Icons.exit_to_app),
            title:  Container(
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