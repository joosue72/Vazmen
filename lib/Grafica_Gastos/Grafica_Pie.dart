
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';



class PieGraphWidget extends StatefulWidget {
  final List<double> data;

  const PieGraphWidget({Key key, this.data}) : super(key: key);

  @override
  _PieGraphWidgetState createState() => _PieGraphWidgetState();
}

class _PieGraphWidgetState extends State<PieGraphWidget> {
  
  @override
  Widget build(BuildContext context) {
  

     List<Series<double, num>> series = [
      Series<double, int>(
        id: 'Variedad',
        colorFn: (_, __) => MaterialPalette.gray.shadeDefault,
        domainFn: (value, index) => index,
        measureFn: (value, _) => value,
        data: widget.data,
        strokeWidthPxFn: (_, __) => 5,
      )
    ];
    return PieChart(series);
  }
}
