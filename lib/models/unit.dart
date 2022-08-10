abstract class Unit {
  num convert(String unitFrom, String unitTo, num value);
  Map<String, String> get units;
  MapEntry<String, String> get defaultUnitFrom;
  MapEntry<String, String> get defaultUnitTo;
}
