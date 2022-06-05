import 'dart:math';

class CalculateBMI {
  final double height;
  final double weight;

  CalculateBMI(this.height, this.weight);

  double _bmi = 0;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    String result = 'Normal';

    if (_bmi < 18.5) result = 'Under Weight';
    if (_bmi > 18.5 && _bmi <= 24.9) result = 'Normal';
    if (_bmi >= 25 && _bmi <= 29.9) result = 'Over Weight';
    if (_bmi > 30 && _bmi <= 39.9) result = 'Obesity';
    if (_bmi >= 40) result = 'Severe Obesity';

    return result;
  }

  String getNarration() {
    String result = '';

    if (_bmi < 18.5) {
      result = 'You are currently under weight, Eat Healthy Food';
    }
    if (_bmi > 18.5 && _bmi <= 24.9) {
      result = 'Your BMI is normal, Maintain the Same Diet';
    }
    if (_bmi >= 25 && _bmi <= 29.9) {
      result = 'Oops! Your BMI states slightly Over Weight, Eat Healthy Food';
    }
    if (_bmi > 30 && _bmi <= 39.9) {
      result =
          'Oops! Your BMI States Obesity, Avoid Junk Food and Eat Healthy Food';
    }
    if (_bmi >= 40) {
      result =
          'Oops!, You BMI States Severe Obesity, Avoid Junk Food else you will die';
    }
    return result;
  }
}
