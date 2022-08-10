import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../models/unit.dart';
import '../models/length_units.dart';
import '../models/speed_units.dart';
import '../models/temperature_units.dart';
import '../models/time_units.dart';
import '../models/volume_units.dart';
import './quantity_button.dart';
import '../screens/unit_converter_screen.dart';

class UnitConverterTab extends StatelessWidget {
  static const routeName = '/unit-converter-screen';

  void openConvertScreen(BuildContext context, Unit unit) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => UnitConvertScreen(unit)));
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              QuantityButton(
                onPressed: () {
                  openConvertScreen(context, Time());
                },
                icon: UniconsLine.clock,
                label: 'Time',
              ),
              QuantityButton(
                onPressed: () {
                  openConvertScreen(context, Length());
                },
                icon: UniconsLine.ruler,
                label: 'Length',
              ),
              QuantityButton(
                onPressed: () {
                  openConvertScreen(context, Temperature());
                },
                icon: UniconsLine.temperature,
                label: 'Temperature',
              ),
              QuantityButton(
                onPressed: () {
                  openConvertScreen(context, Volume());
                },
                icon: UniconsLine.cube,
                label: 'Volume',
              ),
              QuantityButton(
                onPressed: () {
                  openConvertScreen(context, Speed());
                },
                icon: UniconsLine.tachometer_fast,
                label: 'Speed',
              ),
              // QuantityButton(
              //   onPressed: () {},
              //   icon: UniconsLine.pathfinder_unite,
              //   label: 'Area',
              // ),
              // QuantityButton(
              //   onPressed: () {},
              //   icon: UniconsLine.pricetag_alt,
              //   label: 'Discount',
              // ),
              // QuantityButton(
              //   onPressed: () {},
              //   icon: UniconsLine.weight,
              //   label: 'BMI',
              // ),
              // QuantityButton(
              //   onPressed: () {},
              //   icon: UniconsLine.calendar_alt,
              //   label: 'Date',
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
