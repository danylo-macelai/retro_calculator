class Calculator {
  static const operations = const [
    Command.multiplication,
    Command.division,
    Command.subtraction,
    Command.addition,
    Command.equals,
  ];

  final _memory = [0.0, 0.0];
  int _index = 0;
  Command _operation;
  String _answer = '0';
  bool _reset = false; 

  void applyCommand(Command command) {
    if (Command.clean == command) {
      _clear();
    } else if (Command.plus_minus == command) {
      _plusMinus();
    } else if (Command.percentage == command) {
      _percentage();
    } else if (operations.contains(command)) {
      _addOperation(command);
    } else {
      _addDigit(command);
    }
  }

  _clear() {
    _memory.setAll(0, [0.0, 0.0]);
    _index = 0;
    _operation = null;
    _answer = '0';
    _reset = false;
  }

  _plusMinus() {
    _memory[_index] = _memory[_index] * (-1);
    _answer = _toDisplay(_memory[_index]);
  }

  _percentage() {
    _memory[_index] = _memory[_index] / 100;
    _answer = _toDisplay(_memory[_index]);
  }

  _addOperation(Command operation) {
    double value = _memory[0];
    if (Command.equals == operation) {
      if (Command.multiplication == _operation) {
        value = _memory[0] * _memory[1];
      } else if (Command.division == _operation) {
        value = _memory[0] / _memory[1];
      } else if (Command.subtraction == _operation) {
        value = _memory[0] - _memory[1];
      } else if (Command.addition == _operation) {
        value = _memory[0] + _memory[1];
      }
      _clear();
      _answer = _toDisplay(value);
      _memory[_index] = value;
    } else {
      _operation = operation;
      _index = 1;
      _reset = true;
    }
  }

  _addDigit(Command digit) {
    final dot = Command.dot == digit;
    if (dot && _answer.contains('.')) {
      return;
    }
    final empty = dot ? '0' : '';
    final answer = _answer == '0' ? empty : _answer;
    final value = _reset ? '' : answer;
    _answer = value + digit.value;
    _memory[_index] = double.tryParse(_answer);
    _reset = false;
  }

  String _toDisplay(double number) {
    int decimal = number.toInt();
    double fractional = number - number.toInt();
    if (fractional.abs() > 0.0) {
      return number.toString();
    }
    return decimal.toString();
  }

  String get answer {
    return _answer;
  }
}

enum Command {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  clean,
  plus_minus,
  percentage,
  multiplication,
  division,
  subtraction,
  addition,
  equals,
  dot,
}

extension CommandExtension on Command {
  static const values = {
    Command.clean: 'C',
    Command.equals: '=',
    Command.one: '1',
    Command.two: '2',
    Command.three: '3',
    Command.four: '4',
    Command.five: '5',
    Command.six: '6',
    Command.seven: '7',
    Command.eight: '8',
    Command.nine: '9',
    Command.zero: '0',
    Command.dot: '.',
    Command.plus_minus: '±',
    Command.percentage: '%',
    Command.multiplication: '*',
    Command.division: '÷',
    Command.subtraction: '-',
    Command.addition: '+',
  };
  String get value => values[this];
}
