import './unit.dart';

class Volume extends Unit {
  final Map<String, String> _unitMap = const {
    'Cubic meter': 'm\u00B3',
    'Cubic decimeter': 'dm\u00B3',
    'Cubic centimeter': 'cm\u00B3',
    'Cubic millimeter': 'mm\u00B3',
    'Hectoliter': 'hl',
    'Liter': 'l',
    'Deciliter': 'dl',
    'Centiliter': 'cl',
    'Milliliter': 'ml',
    'Cubic foot': 'ft\u00B3',
    'Cubic inch': 'in\u00B3',
    'Cubic yard': 'yd\u00B3',
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
    if (unitFrom == 'm\u00B3') {
      if (unitTo == 'm\u00B3') result = value;
      if (unitTo == 'dm\u00B3') result = value * 1000;
      if (unitTo == 'cm\u00B3') result = value * 1000 * 1000;
      if (unitTo == 'mm\u00B3') result = value * 1000 * 1000 * 1000;
      if (unitTo == 'hl') result = value * 10;
      if (unitTo == 'l') result = value * 10 * 100;
      if (unitTo == 'dl') result = value * 10 * 100 * 10;
      if (unitTo == 'cl') result = value * 10 * 100 * 10 * 10;
      if (unitTo == 'ml') result = value * 10 * 100 * 10 * 10 * 10;
      if (unitTo == 'ft\u00B3') result = value * 35.315;
      if (unitTo == 'in\u00B3') result = value * 61023.7441;
      if (unitTo == 'yd\u00B3') result = value * 1.30795062;
    }
    if (unitFrom == 'dm\u00B3') {
      if (unitTo == 'm\u00B3') result = value / 1000;
      if (unitTo == 'dm\u00B3') result = value;
      if (unitTo == 'cm\u00B3') result = value * 1000;
      if (unitTo == 'mm\u00B3') result = value * 1000 * 1000;
      if (unitTo == 'hl') result = value / 100;
      if (unitTo == 'l') result = value;
      if (unitTo == 'dl') result = value * 10;
      if (unitTo == 'cl') result = value * 10 * 10;
      if (unitTo == 'ml') result = value * 10 * 10 * 10;
      if (unitTo == 'ft\u00B3') result = value * 35.315 / 1000;
      if (unitTo == 'in\u00B3') result = value * 61023.7441 / 1000;
      if (unitTo == 'yd\u00B3') result = value * 1.30795062 / 1000;
    }
    if (unitFrom == 'cm\u00B3') {
      if (unitTo == 'm\u00B3') result = value / 1000 / 1000;
      if (unitTo == 'dm\u00B3') result = value / 1000;
      if (unitTo == 'cm\u00B3') result = value;
      if (unitTo == 'mm\u00B3') result = value * 1000;
      if (unitTo == 'hl') result = value / 100 / 1000;
      if (unitTo == 'l') result = value / 1000;
      if (unitTo == 'dl') result = value / 100;
      if (unitTo == 'cl') result = value / 10;
      if (unitTo == 'ml') result = value;
      if (unitTo == 'ft\u00B3') result = value * 35.315 / 1000 / 1000;
      if (unitTo == 'in\u00B3') result = value * 61023.7441 / 1000 / 1000;
      if (unitTo == 'yd\u00B3') result = value * 1.30795062 / 1000 / 1000;
    }
    if (unitFrom == 'mm\u00B3') {
      if (unitTo == 'm\u00B3') result = value / 1000 / 1000 / 1000;
      if (unitTo == 'dm\u00B3') result = value / 1000 / 1000;
      if (unitTo == 'cm\u00B3') result = value / 1000;
      if (unitTo == 'mm\u00B3') result = value;
      if (unitTo == 'hl') result = value / 100 / 1000 / 1000;
      if (unitTo == 'l') result = value / 1000 / 1000;
      if (unitTo == 'dl') result = value / 100 / 1000;
      if (unitTo == 'cl') result = value / 10 / 1000;
      if (unitTo == 'ml') result = value / 1000;
      if (unitTo == 'ft\u00B3') result = value * 35.315 / 1000 / 1000 / 1000;
      if (unitTo == 'in\u00B3')
        result = value * 61023.7441 / 1000 / 1000 / 1000;
      if (unitTo == 'yd\u00B3')
        result = value * 1.30795062 / 1000 / 1000 / 1000;
    }
    if (unitFrom == 'hl') {
      if (unitTo == 'm\u00B3') result = value / 10;
      if (unitTo == 'dm\u00B3') result = value * 100;
      if (unitTo == 'cm\u00B3') result = value * 100 * 1000;
      if (unitTo == 'mm\u00B3') result = value * 100 * 1000 * 1000;
      if (unitTo == 'hl') result = value;
      if (unitTo == 'l') result = value * 100;
      if (unitTo == 'dl') result = value * 1000;
      if (unitTo == 'cl') result = value * 10 * 1000;
      if (unitTo == 'ml') result = value * 100 * 1000;
      if (unitTo == 'ft\u00B3') result = value * 35.315 / 10;
      if (unitTo == 'in\u00B3') result = value * 61023.7441 / 10;
      if (unitTo == 'yd\u00B3') result = value * 1.30795062 / 10;
    }
    if (unitFrom == 'l') {
      if (unitTo == 'm\u00B3') result = value / 1000;
      if (unitTo == 'dm\u00B3') result = value;
      if (unitTo == 'cm\u00B3') result = value * 1000;
      if (unitTo == 'mm\u00B3') result = value * 1000 * 1000;
      if (unitTo == 'hl') result = value / 100;
      if (unitTo == 'l') result = value;
      if (unitTo == 'dl') result = value * 10;
      if (unitTo == 'cl') result = value * 100;
      if (unitTo == 'ml') result = value * 1000;
      if (unitTo == 'ft\u00B3') result = value * 35.315 / 1000;
      if (unitTo == 'in\u00B3') result = value * 61023.7441 / 1000;
      if (unitTo == 'yd\u00B3') result = value * 1.30795062 / 1000;
    }
    if (unitFrom == 'dl') {
      if (unitTo == 'm\u00B3') result = value / 1000 / 10;
      if (unitTo == 'dm\u00B3') result = value / 10;
      if (unitTo == 'cm\u00B3') result = value * 100;
      if (unitTo == 'mm\u00B3') result = value * 100 * 1000;
      if (unitTo == 'hl') result = value / 1000;
      if (unitTo == 'l') result = value / 10;
      if (unitTo == 'dl') result = value;
      if (unitTo == 'cl') result = value * 10;
      if (unitTo == 'ml') result = value * 100;
      if (unitTo == 'ft\u00B3') result = value * 35.315 / 1000 / 10;
      if (unitTo == 'in\u00B3') result = value * 61023.7441 / 1000 / 10;
      if (unitTo == 'yd\u00B3') result = value * 1.30795062 / 1000 / 10;
    }
    if (unitFrom == 'cl') {
      if (unitTo == 'm\u00B3') result = value / 1000 / 10 / 10;
      if (unitTo == 'dm\u00B3') result = value / 10 / 10;
      if (unitTo == 'cm\u00B3') result = value * 10;
      if (unitTo == 'mm\u00B3') result = value * 10 * 1000;
      if (unitTo == 'hl') result = value / 1000 / 10;
      if (unitTo == 'l') result = value / 10 / 10;
      if (unitTo == 'dl') result = value / 10;
      if (unitTo == 'cl') result = value;
      if (unitTo == 'ml') result = value * 10;
      if (unitTo == 'ft\u00B3') result = value * 35.315 / 1000 / 100;
      if (unitTo == 'in\u00B3') result = value * 61023.7441 / 1000 / 100;
      if (unitTo == 'yd\u00B3') result = value * 1.30795062 / 1000 / 100;
    }
    if (unitFrom == 'ml') {
      if (unitTo == 'm\u00B3') result = value / 1000 / 10 / 10 / 10;
      if (unitTo == 'dm\u00B3') result = value / 10 / 10 / 10;
      if (unitTo == 'cm\u00B3') result = value;
      if (unitTo == 'mm\u00B3') result = value * 1000;
      if (unitTo == 'hl') result = value / 1000 / 10 / 10;
      if (unitTo == 'l') result = value / 10 / 10 / 10;
      if (unitTo == 'dl') result = value / 10 / 10;
      if (unitTo == 'cl') result = value / 10;
      if (unitTo == 'ml') result = value;
      if (unitTo == 'ft\u00B3') result = value * 35.315 / 1000 / 1000;
      if (unitTo == 'in\u00B3') result = value * 61023.7441 / 1000 / 1000;
      if (unitTo == 'yd\u00B3') result = value * 1.30795062 / 1000 / 1000;
    }
    if (unitFrom == 'ft\u00B3') {
      if (unitTo == 'm\u00B3') result = value / 35.315;
      if (unitTo == 'dm\u00B3') result = value / 35.315 * 1000;
      if (unitTo == 'cm\u00B3') result = value / 35.315 * 1000 * 1000;
      if (unitTo == 'mm\u00B3') result = value / 35.315 * 1000 * 1000 * 1000;
      if (unitTo == 'hl') result = value / 35.315 * 10;
      if (unitTo == 'l') result = value / 35.315 * 10 * 100;
      if (unitTo == 'dl') result = value / 35.315 / 10 / 100 * 10;
      if (unitTo == 'cl') result = value / 35.315 / 10 / 100 * 10 * 10;
      if (unitTo == 'ml') result = value / 35.315 / 10 / 100 * 10 * 10 * 10;
      if (unitTo == 'ft\u00B3') result = value;
      if (unitTo == 'in\u00B3') result = value * 1728;
      if (unitTo == 'yd\u00B3') result = value / 27;
    }
    if (unitFrom == 'in\u00B3') {
      if (unitTo == 'm\u00B3') result = value / 61023.7441;
      if (unitTo == 'dm\u00B3') result = value / 61023.74415 * 1000;
      if (unitTo == 'cm\u00B3') result = value / 61023.7441 * 1000 * 1000;
      if (unitTo == 'mm\u00B3')
        result = value / 61023.7441 * 1000 * 1000 * 1000;
      if (unitTo == 'hl') result = value / 61023.7441 * 10;
      if (unitTo == 'l') result = value / 61023.7441 * 10 * 100;
      if (unitTo == 'dl') result = value / 61023.7441 / 10 / 100 * 10;
      if (unitTo == 'cl') result = value / 61023.7441 / 10 / 100 * 10 * 10;
      if (unitTo == 'ml') result = value / 61023.7441 / 10 / 100 * 10 * 10 * 10;
      if (unitTo == 'ft\u00B3') result = value / 1728;
      if (unitTo == 'in\u00B3') result = value;
      if (unitTo == 'yd\u00B3') result = value / 46656;
    }
    if (unitFrom == 'yd\u00B3') {
      if (unitTo == 'm\u00B3') result = value / 1.308;
      if (unitTo == 'dm\u00B3') result = value / 1.308 * 1000;
      if (unitTo == 'cm\u00B3') result = value / 1.308 * 1000 * 1000;
      if (unitTo == 'mm\u00B3') result = value / 1.308 * 1000 * 1000 * 1000;
      if (unitTo == 'hl') result = value / 1.308 * 10;
      if (unitTo == 'l') result = value / 1.308 * 10 * 100;
      if (unitTo == 'dl') result = value / 1.308 / 10 / 100 * 10;
      if (unitTo == 'cl') result = value / 1.308 / 10 / 100 * 10 * 10;
      if (unitTo == 'ml') result = value / 1.308 / 10 / 100 * 10 * 10 * 10;
      if (unitTo == 'ft\u00B3') result = value * 27;
      if (unitTo == 'in\u00B3') result = value;
      if (unitTo == 'yd\u00B3') result = value * 46656;
    }

    var bufRes = result.toInt();
    if (bufRes != result) {
      return result;
    } else {
      return bufRes;
    }
  }
}
