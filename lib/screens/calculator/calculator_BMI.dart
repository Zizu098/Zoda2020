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
    else if (_bmi > 20)
      return 'Complete you docs';
    else if (_bmi > 10)
      return 'BAD';
    else
      return 'A7oooh';
  }

  String getInterpretation() {
    if (_bmi > 80)
      return 'WOW! You have a perfect docs';
    else if (_bmi > 20)
      return 'Ahh! your Docs is not strong ';
    else if (_bmi > 10)
      return 'Ohh No! srry your docs uncorrect!!';
    else
      return 'A7hooh';
  }
}
