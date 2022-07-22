import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../widgets/top_tab_bar.dart';
import '../widgets/quantity_button.dart';

class UnitConverterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopTabBar(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.clock,
                  label: 'Time',
                ),
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.calendar_alt,
                  label: 'Date',
                ),
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.ruler,
                  label: 'Length',
                ),
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.weight,
                  label: 'BMI',
                ),
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.temperature,
                  label: 'Temperature',
                ),
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.cube,
                  label: 'Volume',
                ),
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.tachometer_fast,
                  label: 'Speed',
                ),
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.pricetag_alt,
                  label: 'Discount',
                ),
                QuantityButton(
                  onPressed: () {},
                  icon: UniconsLine.pathfinder_unite,
                  label: 'Area',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
