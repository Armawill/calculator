import './unit.dart';

class Speed extends Unit {
  static const double mach = 880991.1;
  static const double lightspeed = 299792458;
  final Map<String, String> _unitMap = const {
    'Lightspeed': 'c',
    'Mach': 'Ma',
    'Meter per second': 'm/s',
    'Kilometer per hour': 'km/h',
    'Kilometer per second': 'km/s',
    'Knot': 'kn',
    'Mile per hour': 'mph',
    'Foot per second': 'fps',
    'Inch per second': 'ips',
  };

  @override
  MapEntry<String, String> get defaultUnitFrom {
    return _unitMap.entries.elementAt(2);
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
    if (unitFrom == 'c') {
      if (unitTo == 'c') result = value;
      if (unitTo == 'Ma') result = value * 880991.1;
      if (unitTo == 'm/s') result = value * 299792458;
      if (unitTo == 'km/h') result = value * 1.079252848e+9;
      if (unitTo == 'km/s') result = value * 299792458 / 1000;
      if (unitTo == 'kn') result = value * 582749918.35858;
      if (unitTo == 'mph') result = value * 670616629.3844;
      if (unitTo == 'fps') result = value * 983571056.43045;
      if (unitTo == 'ips') result = value * 11802852677.17;
    }
    if (unitFrom == 'Ma') {
      if (unitTo == 'c') result = value / 880991.1;
      if (unitTo == 'Ma') result = value;
      if (unitTo == 'm/s') result = value * 340.29;
      if (unitTo == 'km/h') result = value * 1225.044;
      if (unitTo == 'km/s') result = value * 0.34029;
      if (unitTo == 'kn') result = value * 661.4708;
      if (unitTo == 'mph') result = value * 761.2070;
      if (unitTo == 'fps') result = value * 1116.437;
      if (unitTo == 'ips') result = value * 13397.244094488;
    }
    if (unitFrom == 'm/s') {
      if (unitTo == 'c') result = value / 299792458;
      if (unitTo == 'Ma') result = value / 340.29;
      if (unitTo == 'm/s') result = value;
      if (unitTo == 'km/h') result = value * 3.6;
      if (unitTo == 'km/s') result = value / 1000;
      if (unitTo == 'kn') result = value * 1.94384449;
      if (unitTo == 'mph') result = value * 2.23693629;
      if (unitTo == 'fps') result = value * 3.280840;
      if (unitTo == 'ips') result = value * 39.370078740157;
    }
    if (unitFrom == 'km/h') {
      if (unitTo == 'c') result = value / 1.079252848e+9;
      if (unitTo == 'Ma') result = value / 1225.044;
      if (unitTo == 'm/s') result = value / 3.6;
      if (unitTo == 'km/h') result = value;
      if (unitTo == 'km/s') result = value / 3600;
      if (unitTo == 'kn') result = value / 1.852;
      if (unitTo == 'mph') result = value / 1.609344;
      if (unitTo == 'fps') result = value * 3.280840 / 3.6 / 3.6;
      if (unitTo == 'ips') result = value * 39.370078740157 / 3.6;
    }
    if (unitFrom == 'km/s') {
      if (unitTo == 'c') result = value / 1.079252848e+9 * 3600;
      if (unitTo == 'Ma') result = value / 1225.044 * 3600;
      if (unitTo == 'm/s') result = value * 1000;
      if (unitTo == 'km/h') result = value * 3600;
      if (unitTo == 'km/s') result = value;
      if (unitTo == 'kn') result = value / 1.852 * 3600;
      if (unitTo == 'mph') result = value / 1.609344 * 3600;
      if (unitTo == 'fps') result = value * 3.280840 * 1000;
      if (unitTo == 'ips') result = value * 39.370078740157 * 1000;
    }
    if (unitFrom == 'kn') {
      if (unitTo == 'c') result = value / 582749918.35858;
      if (unitTo == 'Ma') result = value / 661.4708;
      if (unitTo == 'm/s') result = value / 1.94384449;
      if (unitTo == 'km/h') result = value * 1.852;
      if (unitTo == 'km/s') result = value * 1.852 / 3600;
      if (unitTo == 'kn') result = value;
      if (unitTo == 'mph') result = value * 1.15077945;
      if (unitTo == 'fps') result = value * 1.68780986;
      if (unitTo == 'ips') result = value * 20.2537183;
    }
    if (unitFrom == 'mph') {
      if (unitTo == 'c') result = value / 670616629.3844;
      if (unitTo == 'Ma') result = value / 761.2070;
      if (unitTo == 'm/s') result = value / 2.23693629;
      if (unitTo == 'km/h') result = value * 1.609344;
      if (unitTo == 'km/s') result = value * 1.609344 / 3600;
      if (unitTo == 'kn') result = value / 1.15077945;
      if (unitTo == 'mph') result = value;
      if (unitTo == 'fps') result = value * 1.466667;
      if (unitTo == 'ips') result = value * 17.6;
    }
    if (unitFrom == 'fps') {
      if (unitTo == 'c') result = value / 983571056.43045;
      if (unitTo == 'Ma') result = value / 1116.437;
      if (unitTo == 'm/s') result = value / 3.280840;
      if (unitTo == 'km/h') result = value / 3.280840 * 3.6 * 3.6;
      if (unitTo == 'km/s') result = value / 3.280840 / 1000;
      if (unitTo == 'kn') result = value / 1.68780986;
      if (unitTo == 'mph') result = value / 1.466667;
      if (unitTo == 'fps') result = value;
      if (unitTo == 'ips') result = value * 12;
    }
    if (unitFrom == 'ips') {
      if (unitTo == 'c') result = value / 11802852677.17;
      if (unitTo == 'Ma') result = value / 13397.244094488;
      if (unitTo == 'm/s') result = value / 39.370078740157;
      if (unitTo == 'km/h') result = value / 39.370078740157 * 3.6;
      if (unitTo == 'km/s') result = value / 39.370078740157 / 1000;
      if (unitTo == 'kn') result = value / 20.2537183;
      if (unitTo == 'mph') result = value / 17.6;
      if (unitTo == 'fps') result = value / 12;
      if (unitTo == 'ips') result = value;
    }

    var bufRes = result.toInt();
    if (bufRes != result) {
      return result;
    } else {
      return bufRes;
    }
  }
}
