import './unit.dart';

class Length extends Unit {
  final Map<String, String> _unitMap = const {
    'Kilometer': 'km',
    'Meter': 'm',
    'Decimeter': 'dm',
    'Centimeter': 'cm',
    'Millimeter': 'mm',
    'Micrometer': '\u03BCm',
    'Mile': 'mi',
  };

  @override
  MapEntry<String, String> get defaultUnitFrom {
    return _unitMap.entries.elementAt(0);
  }

  @override
  MapEntry<String, String> get defaultUnitTo {
    return _unitMap.entries.elementAt(1);
  }

  @override
  Map<String, String> get units {
    return {..._unitMap};
  }

  @override
  num convert(String unitFrom, String unitTo, num value) {
    var result = value;
    if (unitFrom == 'km') {
      if (unitTo == 'km') result = value;
      if (unitTo == 'm') result = value * 1000;
      if (unitTo == 'dm') result = value * 1000 * 10;
      if (unitTo == 'cm') result = value * 1000 * 10 * 10;
      if (unitTo == 'mm') result = value * 1000 * 10 * 10 * 10;
      if (unitTo == '\u03BCm') result = value * 1000 * 10 * 10 * 10 * 1000;
      if (unitTo == 'mi') result = value * 0.621371192;
    }
    if (unitFrom == 'm') {
      if (unitTo == 'km') result = value / 1000;
      if (unitTo == 'm') result = value;
      if (unitTo == 'dm') result = value * 10;
      if (unitTo == 'cm') result = value * 10 * 10;
      if (unitTo == 'mm') result = value * 10 * 10 * 10;
      if (unitTo == '\u03BCm') result = value * 10 * 10 * 10 * 1000;
      if (unitTo == 'mi') result = value * 0.621371192 / 1000;
    }
    if (unitFrom == 'dm') {
      if (unitTo == 'km') result = value / 1000 / 10;
      if (unitTo == 'm') result = value / 10;
      if (unitTo == 'dm') result = value;
      if (unitTo == 'cm') result = value * 10;
      if (unitTo == 'mm') result = value * 10 * 10;
      if (unitTo == '\u03BCm') result = value * 10 * 10 * 1000;
      if (unitTo == 'mi') result = value * 0.621371192 / 1000 / 10;
    }
    if (unitFrom == 'cm') {
      if (unitTo == 'km') result = value / 1000 / 10 / 10;
      if (unitTo == 'm') result = value / 10 / 10;
      if (unitTo == 'dm') result = value / 10;
      if (unitTo == 'cm') result = value;
      if (unitTo == 'mm') result = value * 10;
      if (unitTo == '\u03BCm') result = value * 10 * 1000;
      if (unitTo == 'mi') result = value * 0.621371192 / 1000 / 10 / 10;
    }
    if (unitFrom == 'mm') {
      if (unitTo == 'km') result = value / 1000 / 10 / 10 / 10;
      if (unitTo == 'm') result = value / 10 / 10 / 10;
      if (unitTo == 'dm') result = value / 10 / 10;
      if (unitTo == 'cm') result = value / 10;
      if (unitTo == 'mm') result = value;
      if (unitTo == '\u03BCm') result = value * 1000;
      if (unitTo == 'mi') result = value * 0.621371192 / 1000 / 10 / 10 / 10;
    }
    if (unitFrom == '\u03BCm') {
      if (unitTo == 'km') result = value / 1000 / 10 / 10 / 10 / 1000;
      if (unitTo == 'm') result = value / 10 / 10 / 10 / 1000;
      if (unitTo == 'dm') result = value / 10 / 10 / 1000;
      if (unitTo == 'cm') result = value / 10 / 1000;
      if (unitTo == 'mm') result = value / 1000;
      if (unitTo == '\u03BCm') result = value;
      if (unitTo == 'mi')
        result = value * 0.621371192 / 1000 / 10 / 10 / 10 / 1000;
    }
    if (unitFrom == 'mi') {
      if (unitTo == 'km') result = value / 0.621371192;
      if (unitTo == 'm') result = value / 0.621371192 * 1000;
      if (unitTo == 'dm') result = value / 0.621371192 * 1000 * 10;
      if (unitTo == 'cm') result = value / 0.621371192 * 1000 * 10 * 10;
      if (unitTo == 'mm') result = value / 0.621371192 * 1000 * 10 * 10 * 10;
      if (unitTo == '\u03BCm')
        result = value / 0.621371192 * 1000 * 10 * 10 * 10 * 1000;
      if (unitTo == 'mi') result = value;
    }

    var bufRes = result.toInt();
    if (bufRes != result) {
      return result;
    } else {
      return bufRes;
    }
  }
}
