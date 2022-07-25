import 'package:flutter/material.dart';

import './widgets/calculator_tab.dart';
import './widgets/unit_converter_tab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> with TickerProviderStateMixin {
  var _tabBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var _tabController = TabController(vsync: this, length: 3);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            key: _tabBarKey,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text('Calculator'),
                ),
                Tab(
                  child: Text('Unit Converter'),
                ),
                Tab(
                  child: Text('Exchange Rate'),
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                50,
            child: TabBarView(
              controller: _tabController,
              children: [
                CalculatorTab(),
                UnitConverterTab(),
                Text('3'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
