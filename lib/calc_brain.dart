import 'dart:math';

class CalcBrain {
  final int height;
  final int weight;
  double? _bmi;
  CalcBrain({required this.weight, required this.height});

  String calculate() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi!.toStringAsFixed(1);
  }

  String result() {
    if (_bmi != null) {
      if (_bmi! >= 25.0) {
        return "Overweight";
      } else if (_bmi! > 18.5) {
        return "Normal";
      } else {
        return "UnderWeight";
      }
    } else {
      return "";
    }
  }

  String getInterp() {
    if (_bmi != null) {
      if (_bmi! >= 25.0) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else if (_bmi! > 18.5) {
        return 'You have a normal body weight. Good job!';
      } else {
        return 'You have a lower than normal body weight. You can eat a bit more.';
      }
    } else {
      return "";
    }
  }
}
