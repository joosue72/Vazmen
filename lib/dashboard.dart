import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vazmen/Ventas.dart';
import 'package:vazmen/detailspage.dart';


 class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
     return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                Text('MENU',
                    style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        textStyle: TextStyle(color: Colors.white))),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Color(0xFF353535)),
                  child: Center(
                    child: Icon(Icons.bookmark_border, color: Colors.white),
                  ),
                )
              ],
            )),
        SizedBox(height: 10.0),
        Container(
            height: MediaQuery.of(context).size.height - 156.0,
            child: ListView(
              children: <Widget>[
                _buildListItem1('assets/frutitas.jpg', 'Ventas',
                    'Registar Una Venta Nueva'),
                _buildListItem1('assets/gas.jpg', 'Gastos',
                    'Registre Un Gasto Nuevo'),
                    _buildListItem('assets/inve.jpg', 'Inventario',
                    'Ver Su Inventario'),
                    _buildListItem('assets/graficos.jpg', 'Gráficos',
                    'Ver Sus Estadísticas'),
                    _buildListItem('assets/distr.jpg', 'Proveedores',
                    'Agregué o vea sus Proveedores')
              ],
            ))
      ],
    );
  }

   _buildListItem(String imgPath, String country, String description) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            Container(height: 300.0),
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.darken))),
            ),
            Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(country,
                        style: GoogleFonts.montserrat(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(color: Colors.white))),
                    Text(description,
                        style: GoogleFonts.montserrat(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            textStyle: TextStyle(color: Colors.white))),
                    SizedBox(height: 20.0),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsPage(imgPath: imgPath, title: country)));
                        },
                        child: Container(
                            height: 50.0,
                            width: 125.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Center(
                                child: Text('Entrar',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        textStyle: TextStyle(
                                            color: Color(0xDD000000)))))))
                  ],
                )))
          ],
        ));
  }
  _buildListItem1(String imgPath, String country, String description) {
    return Padding(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            Container(height: 300.0),
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(imgPath),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6), BlendMode.darken))),
            ),
            Container(
                height: 300.0,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(country,
                        style: GoogleFonts.montserrat(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(color: Colors.white))),
                    Text(description,
                        style: GoogleFonts.montserrat(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                            textStyle: TextStyle(color: Colors.white))),
                    SizedBox(height: 20.0),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Ventas(imgPath: imgPath, title: country)));
                        },
                        child: Container(
                            height: 50.0,
                            width: 125.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white),
                            child: Center(
                                child: Text('Entrar',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                        textStyle: TextStyle(
                                            color: Color(0xDD000000)))))))
                  ],
                )))
          ],
        ));
  }
}