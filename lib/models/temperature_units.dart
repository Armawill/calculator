import './unit.dart';

class Temperature extends Unit {
  final Map<String, String> _unitMap = const {
    'Celsius': '\u00B0C',
    'Fahrenheit': '\u00B0F',
    'Kelvin': 'K',
    'Rankine': '\u00B0R',
    'Reaumur': '\u00B0Re',
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
    if (unitFrom == '\u00B0C') {
      if (unitTo == '\u00B0C') result = value;
      if (unitTo == '\u00B0F') result = value * 9 / 5 + 32;
      if (unitTo == 'K') result = value + 273.15;
      if (unitTo == '\u00B0R') result = value * 9 / 5 + 491.67;
      if (unitTo == '\u00B0Re') result = value * 0.8;
    }
    if (unitFrom == '\u00B0F') {
      if (unitTo == '\u00B0C') result = (value - 32) * 5 / 9;
      if (unitTo == '\u00B0F') result = value;
      if (unitTo == 'K') result = (value - 32) * 5 / 9 + 273.15;
      if (unitTo == '\u00B0R') result = value + 459.67;
      if (unitTo == '\u00B0Re') result = (value - 32) * 0.4444;
    }
    if (unitFrom == '\u00B0K') {
      if (unitTo == '\u00B0C') result = value - 273.15;
      if (unitTo == '\u00B0F') result = (value - 273.15) * 9 / 5 + 32;
      if (unitTo == 'K') result = value;
      if (unitTo == '\u00B0R') result = value * 1.8;
      if (unitTo == '\u00B0Re') result = (value - 273.15) * 0.8;
    }
    if (unitFrom == '\u00B0R') {
      if (unitTo == '\u00B0C') result = (value - 491.67) * 5 / 9;
      if (unitTo == '\u00B0F') result = value - 459.67;
      if (unitTo == 'K') result = value * 5 / 9;
      if (unitTo == '\u00B0R') result = value;
      if (unitTo == '\u00B0Re') result = (value - 491.67) * 0.4444;
    }
    if (unitFrom == '\u00B0Re') {
      if (unitTo == '\u00B0C') result = value * 1.25;
      if (unitTo == '\u00B0F') result = value * 2.25 + 32;
      if (unitTo == 'K') result = value / 0.8 + 273.15;
      if (unitTo == '\u00B0R') result = value * 2.25 + 491.67;
      if (unitTo == '\u00B0Re') result = value;
    }

    var bufRes = result.toInt();
    if (bufRes != result) {
      return result;
    } else {
      return bufRes;
    }
  }
}
