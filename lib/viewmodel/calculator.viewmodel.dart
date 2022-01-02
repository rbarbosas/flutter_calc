import 'package:math_expressions/math_expressions.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CalculatorViewmodel {
  final RxNotifier<String> _expression = RxNotifier<String>("");
  final RxNotifier<String> _input = RxNotifier<String>("");

  String get result {
    try {
      Expression exp = Parser().parse(_expression.value);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (error) {
      return "";
    }
  }

  bool get isInput {
    if (_input.value == "") return false;

    return true;
  }

  String get expression => _expression.value;

  dynamic get input => _input.value;

  void updateInput(String value) {
    _input.value += value;
  }

  void setOperation(String operation) {
    updateInput(operation);
    _expression.value += input;
    _input.value = "";
  }

  void setPercentage() {
    if (input != "" && expression != "") {
      var value = num.tryParse(result)?.toDouble() ?? 0;
      var percentage = num.tryParse(input)?.toDouble() ?? 0;

      _input.value = ((value / 100) * percentage).toString();
    }
  }

  void clearExpression() {
    _input.value = "";
    _expression.value = "";
  }

  void clearInput() {
    _input.value = "";
  }
}
