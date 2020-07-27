class CalculatorBMI {
   int passport;
   int language;
   int money;
   int education; 
   int age;
   int _bmi;

    CalculatorBMI({this.money, this.passport,this.age, this.education,this.language});
   int getBMI() {
     _bmi = money + passport + age + language + education ;    
     return _bmi;
  }

  String getResult() {
    if (_bmi > 60)
      return 'Good';
    else if (_bmi > 40)
      return 'Complete you docs';
    else if (_bmi > 20)
      return 'BAD';
    else if(_bmi > 0 && _bmi <= 20)
      return 'Very Bad';
  }

  String getInterpretation() {
    if (_bmi > 60)
      return 'WOW! You have a perfect documents';
    else if (_bmi > 40)
      return 'Ahh! your Docs is not strong ';
    else if (_bmi > 20)
      return 'Ohh No! sorry your documents uncorrect!!';
    else if(_bmi > 0 && _bmi <= 20)
      return 'ohh No! sorry your docs refused';
  }
}
