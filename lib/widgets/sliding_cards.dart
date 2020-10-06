import 'package:flutter/material.dart';
import 'package:vazmen/widgets/sliding_card.dart';
import 'package:vazmen/widgets/sliding_card2.dart';

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
   PageController pageController;
   double pageOffset = 0;
   @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
      pageController.addListener(() {
      setState(() => pageOffset = pageController.page); //<-- add listener and set state
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,  //<-- set height of the card
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Grafica de Ventas',
            date: 'Encontrarás un registro de todas las ventas',
            assetName: 'sales.png',
             offset: pageOffset, 
             
          ),
          SlidingCard2(
            name: 'Grafica de Gastos ',
            date: 'Encontrarás un registro de gastos de la empresa',
            assetName: 'sales2.png',
             offset: pageOffset, 
          ),
        ],
      )
    );
  }
}