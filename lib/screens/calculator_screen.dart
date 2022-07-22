import 'package:flutter/material.dart';

import '../widgets/calc_button.dart';
import '../widgets/top_tab_bar.dart';

class CalcScreen extends StatefulWidget {
  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  var textController = TextEditingController();
  var resultTextController = TextEditingController();

  List<num> _numbers = [];
  List<num> _interimNumbers = [];
  List<String> operations = [];
  List<String> interimOperations = [];
  num res = 0;

  void _tapNum(String digit) {
    textController.text += digit;
    num? number;
    if (operations.isEmpty) {
      number = int.tryParse(textController.text) ??
          double.tryParse(textController.text);
      if (_numbers.isEmpty) {
        _numbers.add(number ?? 0);
      } else {
        _numbers[0] = number ?? 0;
      }
    } else {
      var lastOperIndex = textController.text.lastIndexOf(operations.last);
      number = int.tryParse(textController.text.substring(lastOperIndex + 1)) ??
          double.tryParse(textController.text.substring(lastOperIndex + 1));
      if (_numbers.length == operations.length) {
        if (number != null) {
          _numbers.add(number);
        }
      } else {
        if (number != null) {
          _numbers.last = number;
        }
      }
    }
    //print(_numbers);

    res = _calculate();
    resultTextController.text = (res).toString();
  }

  num _calculate() {
    _interimNumbers.clear();
    interimOperations.clear();
    for (int i = 0; i < operations.length; i++) {
      if (operations.isNotEmpty && _numbers.length > 1) {
        if (operations[i] == '\u00F7' || operations[i] == '\u00d7') {
          if (i > 0) {
            if (operations[i - 1] == '\u00F7' ||
                operations[i - 1] == '\u00d7') {
              var number = _performOperation(
                  _interimNumbers.last, _numbers[i + 1], operations[i]);
              _interimNumbers.last = number;
            } else {
              _interimNumbers.last = _performOperation(
                  _interimNumbers.last, _numbers[i + 1], operations[i]);
            }
          } else {
            // print(i);
            _interimNumbers.add(
                _performOperation(_numbers[i], _numbers[i + 1], operations[i]));
          }
          // '+' or '-'
        } else {
          if (i > 0) {
            interimOperations.add(operations[i]);
            if (operations[i - 1] == '\u00F7' ||
                operations[i - 1] == '\u00d7') {
              _interimNumbers.add(_numbers[i + 1]);
            } else {
              _interimNumbers.add(_numbers[i + 1]);
            }
          } else {
            interimOperations.add(operations[i]);
            _interimNumbers.add(_numbers[i]);
            _interimNumbers.add(_numbers[i + 1]);
          }
        }
      } else {
        return _numbers[0];
      }
    }
    // print(_interimNumbers);
    // print(interimOperations);
    num result = 0;
    if (interimOperations.isNotEmpty) {
      for (int i = 0; i < interimOperations.length; i++) {
        if (i == 0) {
          result = _performOperation(
              _interimNumbers[i], _interimNumbers[i + 1], interimOperations[i]);
        } else {
          result = _performOperation(
              result, _interimNumbers[i + 1], interimOperations[i]);
        }
        //print(result);
      }
    } else if (_interimNumbers.isNotEmpty) {
      result = _interimNumbers.last;
    } else {
      result = _numbers.last;
    }
    return result;
  }

  num _performOperation(num num1, num num2, String oper) {
    switch (oper) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '\u00d7':
        return num1 * num2;
      case '\u00F7':
        return num1 / num2 == num1 ~/ num2 ? num1 ~/ num2 : num1 / num2;
      default:
        return 0;
    }
  }

  void _tapOper(String oper) {
    if (textController.text != 0 && textController.text != '') {
      // var num = int.tryParse(textController.text) ??
      //     double.tryParse(textController.text) ??
      //     int.tryParse(resultTextController.text) ??
      //     double.tryParse(resultTextController.text);
      // if (num != null) {
      //   _numbers.add(num);
      // }
      textController.text += oper;
      operations.add(oper);
    }
  }

  void _deleteSymbol() {
    if (textController.text.isNotEmpty) {
      if (operations.isNotEmpty &&
          textController.text[textController.text.length - 1] ==
              operations.last) {
        operations.removeLast();
      }
      textController.text =
          textController.text.substring(0, textController.text.length - 1);
    }

    var number;
    if (operations.isNotEmpty) {
      if (textController.text[textController.text.length - 1] ==
          operations.last) {
        _numbers.removeLast();
      } else {
        var lastOperIndex = textController.text.lastIndexOf(operations.last);
        number = int.tryParse(
                textController.text.substring(lastOperIndex + 1)) ??
            double.tryParse(textController.text.substring(lastOperIndex + 1));
        _numbers.last = number!;
      }
    } else {
      if (textController.text.isNotEmpty) {
        number = int.tryParse(textController.text) ??
            double.tryParse(textController.text);
        _numbers.last = number;
      }
    }

    // print(_numbers);
    res = _calculate();
    resultTextController.text = (res).toString();
    if (textController.text.isEmpty) {
      resultTextController.text = '0';
    }
  }

  void _clear() {
    textController.text = '';
    resultTextController.text = '0';
    _numbers.clear();
    operations.clear();
  }

  void _getResult() {
    // print(res);
    _clear();
    _numbers.add(res);
    resultTextController.text = res.toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    resultTextController.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopTabBar(),
          TextField(
            readOnly: true,
            textAlign: TextAlign.right,
            controller: textController,
            // style: TextStyle(
            //   fontSize: textController.text.isEmpty ? 20 : 24,
            // ),
          ),
          TextField(
            readOnly: true,
            textAlign: TextAlign.right,
            controller: resultTextController,
            // style: TextStyle(
            //   fontSize: textController.text.isEmpty ? 24 : 20,
            // ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                CalcButton('C', _clear),
                CalcButton('\u232b', _deleteSymbol),
                CalcButton('%', () {}),
                CalcButton('\u00F7', () {
                  _tapOper('\u00F7');
                }),
                CalcButton(
                  '7',
                  () {
                    _tapNum('7');
                  },
                ),
                CalcButton(
                  '8',
                  () {
                    _tapNum('8');
                  },
                ),
                CalcButton(
                  '9',
                  () {
                    _tapNum('9');
                  },
                ),
                CalcButton('\u00d7', () {
                  _tapOper('\u00d7');
                }),
                CalcButton(
                  '4',
                  () {
                    _tapNum('4');
                  },
                ),
                CalcButton(
                  '5',
                  () {
                    _tapNum('5');
                  },
                ),
                CalcButton(
                  '6',
                  () {
                    _tapNum('6');
                  },
                ),
                CalcButton('-', () {
                  _tapOper('-');
                }),
                CalcButton(
                  '1',
                  () {
                    _tapNum('1');
                  },
                ),
                CalcButton(
                  '2',
                  () {
                    _tapNum('2');
                  },
                ),
                CalcButton(
                  '3',
                  () {
                    _tapNum('3');
                  },
                ),
                CalcButton('+', () {
                  _tapOper('+');
                }),
                IconButton(
                  icon: Icon(Icons.change_circle_outlined),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                ),
                CalcButton(
                  '0',
                  () {
                    _tapNum('0');
                  },
                ),
                CalcButton('.', () {}),
                CalcButton('=', _getResult),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
