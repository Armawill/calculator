import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/calc_button.dart';
import '../models/unit.dart';

class UnitConvertScreen extends StatefulWidget {
  final Unit unit;
  //final String tag;

  UnitConvertScreen(this.unit);

  @override
  State<UnitConvertScreen> createState() => _UnitConvertScreenState();
}

class _UnitConvertScreenState extends State<UnitConvertScreen> {
  var _textECFrom = '0';
  var _textECTo = '0';
  late String _unitFrom, _unitTo;
  late String _labelFrom, _labelTo;

  void labelFrom(String value) => _labelFrom = value;
  void labelTo(String value) => _labelTo = value;
  void unitFrom(String value) => _unitFrom = value;
  void unitTo(String value) => _unitTo = value;
  void textECFrom(String value) => _textECFrom = value;
  void textECTo(String value) => _textECTo = value;
  String getTextECFrom() => _textECFrom;
  String getTextECTo() => _textECTo;

  @override
  void initState() {
    _unitFrom = widget.unit.defaultUnitFrom.value;
    _labelFrom = widget.unit.defaultUnitFrom.key;
    _unitTo = widget.unit.defaultUnitTo.value;
    _labelTo = widget.unit.defaultUnitTo.key;
    super.initState();
  }

  Future<List<String>?> _showUnitList(
      BuildContext ctx, Map<String, String> unitMap) async {
    final result = await showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.75),
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Select Unit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.75 - 43 >
                          unitMap.length * 56
                      ? unitMap.length * 56
                      : MediaQuery.of(context).size.height * 0.75 - 43,
                  child: ListView.builder(
                    itemCount: unitMap.length,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        onTap: () {
                          List<String> list = [
                            unitMap.keys.elementAt(index),
                            unitMap.values.elementAt(index)
                          ];

                          Navigator.pop(context, list);
                        },
                        title: Text(
                            '${unitMap.keys.elementAt(index)} ${unitMap.values.elementAt(index)}'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    // When a BuildContext is used from a StatefulWidget, the mounted property
    // must be checked after an asynchronous gap.
    if (!mounted) return null;
    return result;
  }

  void _clear() {
    setState(() {
      _textECFrom = '0';
      _textECTo = '0';
    });
  }

  void addComma(num value, Function setText, Function getText) {
    String text;
    bool firstComma = true;
    while (value / 1000 >= 1) {
      text = getText();
      if (text.contains('.')) {
        var dotIndex = text.indexOf('.');
        if (firstComma) {
          firstComma = false;
          setText(text.substring(0, dotIndex - 3) +
              ',' +
              text.substring(dotIndex - 3));
        } else {
          var commaIndex = text.indexOf(',');
          setText(text.substring(0, commaIndex - 3) +
              ',' +
              text.substring(commaIndex - 3));
        }
      } else {
        if (firstComma) {
          firstComma = false;
          setText(text.substring(0, text.length - 3) +
              ',' +
              text.substring(text.length - 3));
        } else {
          var commaIndex = text.indexOf(',');
          setText(text.substring(0, commaIndex - 3) +
              ',' +
              text.substring(commaIndex - 3));
        }
      }
      value /= 1000;
    }
  }

  void getValue() {
    _textECFrom = _textECFrom.replaceAll(RegExp(r','), '');
    var initVal = num.tryParse(_textECFrom);
    var resVal;
    if (initVal != null) {
      resVal = widget.unit.convert(_unitFrom, _unitTo, initVal);
      setState(() {
        _textECTo = resVal.toString();
        addComma(resVal, textECTo, getTextECTo);
      });
    }
  }

  void _tap(String value) {
    setState(() {
      if (_textECFrom == '0') {
        _textECFrom = value;
      } else {
        _textECFrom += value;
      }
    });
    getValue();
    setState(() {
      addComma(num.parse(_textECFrom), textECFrom, getTextECFrom);
    });
  }

  void _tapDot() {
    if (_textECFrom.isEmpty) {
      setState(() {
        _textECFrom += '0.';
      });
    } else if (!_textECFrom.contains('.')) {
      setState(() {
        _textECFrom += '.';
      });
    }
  }

  void _deleteSymbol() {
    setState(() {
      _textECFrom = _textECFrom.substring(0, _textECFrom.length - 1);
    });
    getValue();
    if (_textECFrom.isNotEmpty) {
      setState(() {
        addComma(num.parse(_textECFrom), textECFrom, getTextECFrom);
      });
    } else {
      _clear();
    }
  }

  Widget _buildRow(
      {required BuildContext context,
      required Function setLabel,
      required Function setUnit,
      required String unit,
      required String label,
      required String text}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth - 60);
        return Padding(
          padding: const EdgeInsets.only(right: 20, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  _showUnitList(context, widget.unit.units).then((value) {
                    if (value != null) {
                      setState(() {
                        setLabel(value[0]);
                        setUnit(value[1]);
                      });
                    }
                    getValue();
                  });
                },
                child: Row(
                  children: [
                    Text(
                      unit,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text(
                      '\u25BC',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                width: constraints.maxWidth - 84,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Text(label),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time converter'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          height: MediaQuery.of(context).size.height - 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    _buildRow(
                        context: context,
                        setLabel: labelFrom,
                        setUnit: unitFrom,
                        unit: _unitFrom,
                        label: _labelFrom,
                        text: _textECFrom),
                    _buildRow(
                        context: context,
                        setLabel: labelTo,
                        setUnit: unitTo,
                        unit: _unitTo,
                        label: _labelTo,
                        text: _textECTo),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Divider(),
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      children: [
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('9', () {
                            _tap('9');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('8', () {
                            _tap('8');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('7', () {
                            _tap('7');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: CalcButton('AC', _clear),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('6', () {
                            _tap('6');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('5', () {
                            _tap('5');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('4', () {
                            _tap('4');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('3', () {
                            _tap('3');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('2', () {
                            _tap('2');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('1', () {
                            _tap('1');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 2,
                          child: CalcButton('\u232b', _deleteSymbol),
                        ),
                        const StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: SizedBox(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('0', () {
                            _tap('0');
                          }),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: 1,
                          child: CalcButton('.', _tapDot),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
