import './unit.dart';

class Time extends Unit {
  final Map<String, String> _unitMap = const {
    'Year': 'y',
    'Week': 'wk',
    'Day': 'd',
    'Hour': 'h',
    'Minute': 'min',
    'Second': 's',
    'Millisecond': 'ms',
    // 'Microsecond': '\u03BCs',
    // 'Picosecond': 'ps',
  };

  @override
  MapEntry<String, String> get defaultUnitFrom {
    return _unitMap.entries.elementAt(5);
  }

  @override
  MapEntry<String, String> get defaultUnitTo {
    return _unitMap.entries.elementAt(3);
  }

  @override
  Map<String, String> get units {
    return {..._unitMap};
  }

  @override
  num convert(String unitFrom, String unitTo, num value) {
    var result = value;
    if (unitFrom == 'ms') {
      if (unitTo == 'ms') result = value;
      if (unitTo == 's') result = value / 1000;
      if (unitTo == 'min') result = value / 1000 / 60;
      if (unitTo == 'h') result = value / 1000 / 60 / 60;
      if (unitTo == 'd') result = value / 1000 / 60 / 60 / 24;
      if (unitTo == 'wk') result = value / 1000 / 60 / 60 / 24 / 7;
      if (unitTo == 'y') result = value / 1000 / 60 / 60 / 24 / 365;
    }
    if (unitFrom == 's') {
      if (unitTo == 'ms') result = value * 1000;
      if (unitTo == 's') result = value;
      if (unitTo == 'min') result = value / 60;
      if (unitTo == 'h') result = value / 60 / 60;
      if (unitTo == 'd') result = value / 60 / 60 / 24;
      if (unitTo == 'wk') result = value / 60 / 60 / 24 / 7;
      if (unitTo == 'y') result = value / 60 / 60 / 24 / 365;
    }
    if (unitFrom == 'min') {
      if (unitTo == 'ms') result = value * 60 * 1000;
      if (unitTo == 's') result = value * 60;
      if (unitTo == 'min') result = value;
      if (unitTo == 'h') result = value / 60;
      if (unitTo == 'd') result = value / 60 / 24;
      if (unitTo == 'wk') result = value / 60 / 24 / 7;
      if (unitTo == 'y') result = value / 60 / 24 / 365;
    }
    if (unitFrom == 'h') {
      if (unitTo == 'ms') result = value * 60 * 60 * 1000;
      if (unitTo == 's') result = value * 60 * 60;
      if (unitTo == 'min') result = value * 60;
      if (unitTo == 'h') result = value;
      if (unitTo == 'd') result = value / 24;
      if (unitTo == 'wk') result = value / 24 / 7;
      if (unitTo == 'y') result = value / 24 / 365;
    }
    if (unitFrom == 'd') {
      if (unitTo == 'ms') result = value * 24 * 60 * 60 * 1000;
      if (unitTo == 's') result = value * 24 * 60 * 60;
      if (unitTo == 'min') result = value * 24 * 60;
      if (unitTo == 'h') result = value * 24;
      if (unitTo == 'd') result = value;
      if (unitTo == 'wk') result = value / 7;
      if (unitTo == 'y') result = value / 365;
    }
    if (unitFrom == 'wk') {
      if (unitTo == 'ms') result = value * 7 * 24 * 60 * 60 * 1000;
      if (unitTo == 's') result = value * 7 * 24 * 60 * 60;
      if (unitTo == 'min') result = value * 7 * 24 * 60;
      if (unitTo == 'h') result = value * 7 * 24;
      if (unitTo == 'd') result = value * 7;
      if (unitTo == 'wk') result = value;
      if (unitTo == 'y') result = value * 7 / 365;
    }
    if (unitFrom == 'y') {
      if (unitTo == 'ms') result = value * 365 * 24 * 60 * 60 * 1000;
      if (unitTo == 's') result = value * 365 * 24 * 60 * 60;
      if (unitTo == 'min') result = value * 365 * 24 * 60;
      if (unitTo == 'h') result = value * 365 * 24;
      if (unitTo == 'd') result = value * 365;
      if (unitTo == 'wk') result = value / 7 * 365;
      if (unitTo == 'y') result = value * 7 / 365;
    }
    var bufRes = result.toInt();
    if (bufRes != result) {
      return result;
    } else {
      return bufRes;
    }
  }
}
