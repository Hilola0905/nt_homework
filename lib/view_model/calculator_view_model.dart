import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorViewModel extends ChangeNotifier {
  CalculatorViewModel();

  String title = "0";
  String result = "0";

  Future<void> writeNumber(String number) async {
    if (title != "0" ) {
      if(result!="0"){
        title=result+number;
        result="0";
      }
      else{
        title = title + number;
      }
      notifyListeners();
    }
    else {
      title = number;
      notifyListeners();
    }
  }

  Future<void> clearNumber() async {
    title = "0";
    notifyListeners();
  }

  Future<void> deleteNumber() async {
    String title1 = title.substring(0, title.length - 1);
    title = title1;
    notifyListeners();
  }

  Future<void> getResult(String equation) async {
    String doesContainDecimal(dynamic result) {
      if (result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if (!(int.parse(splitDecimal[1]) > 0)) {
          return result = splitDecimal[0].toString();
        }
      }
      return result;
    }
    String expression="0";
     notifyListeners();

      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');
      expression = expression.replaceAll('%', '%');
      notifyListeners();
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        notifyListeners();
        if (expression.contains('%')) {
          result = doesContainDecimal(result);
          notifyListeners();
        }
      } catch (e) {
        result = "Error";
        notifyListeners();
      }
      if(result!="Error"){
        title=title+"\n"+"$result";
        notifyListeners();
      }

  }
}