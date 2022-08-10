import 'package:flutter/material.dart';

import 'calc_button.dart';

class CalculatorTab extends StatefulWidget {
  static const routeName = '/calculator-screen';
  @override
  State<CalculatorTab> createState() => _CalculatorTabState();
}

class _CalculatorTabState extends State<CalculatorTab> {
  var textController = TextEditingController();
  var resultTextController = TextEditingController();

  List<num> _numbers = [];
  List<num> _interimNumbers = [];
  List<String> operations = [];
  List<String> interimOperations = [];
  num res = 0;

  String getResText() => resultTextController.text;
  String getText() => textController.text;
  void setResText(String value) {
    resultTextController.text = value;
  }

  void setText(String value) {
    textController.text = value;
  }

  void _tapNum(String digit) {
    textController.text = textController.text.replaceAll(RegExp(r','), '');
    var last = textController.text.length - 1;

    if (textController.text == '0' && (digit == '0' || digit == '00')) {
      return;
    }
    if ((textController.text.isEmpty ||
            (operations.isNotEmpty &&
                textController.text[last] == operations.last)) &&
        digit == '00') {
      digit = digit[0];
    }
    if (textController.text.isNotEmpty &&
        textController.text[last] == '0' &&
        (operations.isNotEmpty &&
            textController.text[last - 1] == operations.last)) {
      if (digit == '00') {
        textController.text =
            textController.text.replaceRange(last, null, digit[0]);
      } else {
        textController.text =
            textController.text.replaceRange(last, null, digit);
      }
    } else {
      if (textController.text == '0' && digit != '0') {
        textController.text = digit;
      } else {
        textController.text += digit;
      }
    }

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
    addCommaToNumber();
    //print(_numbers);

    _setResult();
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

  void addCommaToNumber() {
    num value;
    String text;
    String fullText = '';
    for (int i = 0; i < _numbers.length; i++) {
      if (_numbers[i] >= 1000) {
        value = _numbers[i];
        text = _numbers[i].toString();
        addComma(
          value,
          (val) {
            text = val;
          },
          () {
            return text;
          },
        );
        fullText += text;
        if (operations.length > i) {
          fullText += operations[i];
        }
      } else {
        fullText += _numbers[i].toString();
        if (operations.length > i) {
          fullText += operations[i];
        }
      }
    }
    textController.text = fullText;
  }

  void _setResult() {
    try {
      res = _calculate();
      resultTextController.text = res.toString();
      addComma(res, setResText, getResText);
    } on IntegerDivisionByZeroException {
      print('division by zero');
      resultTextController.text = 'Can\'t devide by zero';
    }
  }

  num _calculate() {
    textController.text.replaceAll(RegExp(r','), '');
    _interimNumbers.clear();
    interimOperations.clear();
    for (int i = 0; i < operations.length; i++) {
      if (operations.isNotEmpty && _numbers.length > 1) {
        if (i == operations.length - 1 &&
            _numbers.length == operations.length) {
          break;
        }
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
    num result;
    switch (oper) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '\u00d7':
        result = num1 * num2;
        break;
      case '\u00F7':
        // if (num2 == 0) {
        //   setState(() {
        //     resultTextController.text = 'Can\'t devide by zero';
        //   });
        // }
        result = num1 / num2 == num1 ~/ num2 ? num1 ~/ num2 : num1 / num2;
        break;
      default:
        return 0;
    }
    var bufRes = result.toInt();
    if (bufRes == result) {
      return bufRes;
    } else {
      return result;
    }
  }

  void _tapOper(String oper) {
    if (/*textController.text != 0 &&*/ textController.text != '') {
      textController.text += oper;
      operations.add(oper);
    }
    if (textController.text.isEmpty && resultTextController.text.isNotEmpty) {
      textController.text += res.toString();
      _numbers.add(res);
      textController.text += oper;
      operations.add(oper);
    }
  }

  void _tapPercent() {
    if (operations.isEmpty) {
      _numbers.last = _numbers.last / 100;
      textController.text = _numbers.last.toString();
    } else {
      if (textController.text[textController.text.length - 1] !=
          operations.last) {
        _numbers.last = _numbers.last / 100;
        textController.text = textController.text.replaceRange(
            textController.text.lastIndexOf(operations.last) + 1,
            null,
            _numbers.last.toString());
      }
    }
    _setResult();
  }

  void _tapDot() {
    var text = textController.text;

    if (text.isEmpty) {
      textController.text += '0.';
    } else if ((operations.isEmpty && !text.contains('.')) ||
        (operations.isNotEmpty &&
            text.lastIndexOf('.') < text.lastIndexOf(operations.last))) {
      textController.text += '.';
    }
  }

  void _deleteSymbol() {
    textController.text = textController.text.replaceAll(RegExp(r','), '');
    if (textController.text.isNotEmpty) {
      if (operations.isNotEmpty &&
          textController.text[textController.text.length - 1] ==
              operations.last) {
        operations.removeLast();
      }
      if (textController.text.length > 1) {
        textController.text =
            textController.text.substring(0, textController.text.length - 1);
      } else {
        textController.text = '0';
      }
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
        _numbers.last = number;
      }
    } else {
      if (textController.text.isNotEmpty) {
        number = int.tryParse(textController.text) ??
            double.tryParse(textController.text);
        _numbers.last = number;
      }
      textController.text = '0';
    }

    // print(_numbers);
    addCommaToNumber();
    _setResult();
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
    _clear();
    resultTextController.text = res.toString();
    addComma(res, setResText, getResText);
  }

  @override
  void initState() {
    // TODO: implement initState
    resultTextController.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextField(
          readOnly: true,
          textAlign: TextAlign.right,
          controller: textController,
          style: TextStyle(
            // fontSize: textController.text.isEmpty ? 20 : 24,
            fontSize: 20,
          ),
        ),
        TextField(
          readOnly: true,
          textAlign: TextAlign.right,
          controller: resultTextController,
          style: TextStyle(
            // fontSize: textController.text.isEmpty ? 24 : 20,
            fontSize: 24,
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            children: [
              CalcButton('C', _clear),
              CalcButton('\u232b', _deleteSymbol),
              CalcButton('%', _tapPercent),
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
              // IconButton(
              //   icon: Icon(Icons.change_circle_outlined),
              //   color: Theme.of(context).primaryColor,
              //   onPressed: () {},
              // ),
              CalcButton(
                '00',
                () {
                  _tapNum('00');
                },
              ),
              CalcButton(
                '0',
                () {
                  _tapNum('0');
                },
              ),
              CalcButton('.', _tapDot),
              CalcButton('=', _getResult),
            ],
          ),
        ),
      ],
    );
  }
}
