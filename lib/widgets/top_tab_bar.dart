import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class TopTabBar extends StatefulWidget {
  @override
  State<TopTabBar> createState() => _TopTabBarState();
}

class _TopTabBarState extends State<TopTabBar> {
  bool isCalculator = false, isConverter = false, isExchangeRate = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      //color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (!isCalculator) {
                setState(() {
                  isCalculator = true;
                  isConverter = false;
                  isExchangeRate = false;
                });
                Navigator.of(context)
                    .pushReplacementNamed('/calculator-screen');
              }
            },
            icon: Icon(
              isCalculator ? Icons.calculate_rounded : Icons.calculate_outlined,
              size: 30,
              color:
                  isCalculator ? Theme.of(context).primaryColor : Colors.black,
            ),
            splashRadius: 1,
          ),
          IconButton(
            onPressed: () {
              if (!isConverter) {
                setState(() {
                  isCalculator = false;
                  isConverter = true;
                  isExchangeRate = false;
                });
                Navigator.of(context)
                    .pushReplacementNamed('/unit-converter-screen');
              }
            },
            icon: Icon(
              isConverter ? UniconsSolid.apps : UniconsLine.apps,
              color:
                  isConverter ? Theme.of(context).primaryColor : Colors.black,
            ),
            splashRadius: 1,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isCalculator = false;
                isConverter = false;
                isExchangeRate = true;
              });
            },
            icon: Icon(
              Icons.attach_money_sharp,
              size: 30,
              color: isExchangeRate
                  ? Theme.of(context).primaryColor
                  : Colors.black,
            ),
            splashRadius: 1,
          ),
        ],
      ),
    );
  }
}
