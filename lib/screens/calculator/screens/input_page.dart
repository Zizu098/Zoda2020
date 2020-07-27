import 'dart:math';

import 'package:flutter/services.dart';
import 'package:zoda/screens/calculator/calculator_BMI.dart' show CalculatorBMI;
import 'package:zoda/screens/calculator/components/reusable_card.dart';
import 'package:zoda/screens/calculator/components/round_icon_button.dart';
import 'package:zoda/screens/calculator/constants.dart';
import 'package:zoda/screens/calculator/screens/bottom_button.dart';
import 'package:zoda/screens/calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:zoda/theme/input.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool _language = false;
  bool _passport = false;
  double _money = 0.0;
  int money = 0, passport = 0, _age = 1, education = 0, language = 0, age = 0;
  void _onChanged(bool value) => setState(() => {
        if (_language == false) {language = 20} else {language = 0},
        _language = value,
      });
  void _onChangedpass(bool value) => setState(() => { 
        if (_passport == false) {passport = 20} else {passport = 0},
        _passport = value
      });
  void _setValue(double value) => setState(() => {
        money = value.round(),
        if ((value*1000) >= 300 ) {money = 20} else if( 300 > (value*1000) && (value*1000) >= 100) {money = 10} else{money = 0},
        _money = value,
      });
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SCORE'),
          centerTitle: true,
          backgroundColor: Colors.amber[700],
        ),
        body: Container(
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SwitchListTile(
                    value: _language,
                    onChanged: _onChanged,
                    title: Text(
                      'Certified Language',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    activeColor: Colors.amber[700],
                  ),
                  SwitchListTile(
                    value: _passport,
                    onChanged: _onChangedpass,
                    title: Text(
                      'Passport',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    activeColor: Colors.amber[700],
                  ),
                  Row(
                  
                  
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                    Text(
                      'Age',
                      style: TextStyle(fontSize: 20),
                    ),
                  
                      IconButton(
                        icon: Icon(Icons.remove),
                        splashColor: Colors.amber[900],
                        onPressed: () {
                          setState(() {
                            if (_age > 0) {_age--;}
                            if(_age <= 22) {age = 20;}
                            else if (_age > 22 && _age <= 40) {age = 15;}
                            else {age = 10;}
                          });
                        },
                      ),
                      Text(
                        '${(_age)}',
                        style: TextStyle(fontSize: 20),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        splashColor: Colors.amber[900],
                        onPressed: () {
                          setState(() {
                            _age++;
                            if(_age <= 22) {age = 20;}
                            else if (_age > 22 && _age <= 40) {age = 15;}
                            else {age = 10;}
                          });
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: Text(
                      'Money: ${(_money * 1000).round()}'+'K',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Slider(
                    value: _money,
                    onChanged: _setValue,
                    activeColor: Colors.amber[800],
                  ),
                  Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 200.0, top: 10.0),
                      child: Text(
                        'Education?',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: ButtonTheme(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            RaisedButton(
                              textColor: Colors.black,
                              color: Colors.amber[700],
                              child: Text("PHD"),
                              onPressed: () {
                                setState(() {
                                  education = 15;
                                });
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            Spacer(),
                            RaisedButton(
                              textColor: Colors.black,
                              color: Colors.amber[700],
                              child: Text("SEC"),
                              onPressed: () {
                                setState(() {
                                  education = 20;
                                });
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            Spacer(),
                            RaisedButton(
                              textColor: Colors.black,
                              color: Colors.amber[700],
                              child: Text("NONE"),
                              onPressed: () {
                                setState(() {
                                  education = 0;
                                });
                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 70,
          child: RaisedButton(
            child: Text('SCORE',
                style: TextStyle(fontSize: 35, fontFamily: 'RobotoMono')),
            color: Colors.amber[700],
            onPressed: () {
              CalculatorBMI calc = CalculatorBMI(
                  money: money,
                  passport: passport,
                  age: age,
                  language: language,
                  education: education);
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => ResultsPage(
                          bmiResult: calc.getBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )),
              );
            },
          ),
        ));
  }
}

// Container(
//         child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                /* Expanded(
//                   child: ReusableCard(
//                      color: kActiveCardColor,
//                     cardChild: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'PassPort?',
//                           style: kLabelStyle,
//                         ),
//                          SizedBox(height: 25),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[

//                             RoundIconButton(
//                               icon: Icons.clear,
//                               onPressed: () {
//                                 setState(() {
//                                     passport=0 ;
//                                 });
//                               },
//                             ),
//                             RoundIconButton(
//                               icon: Icons.check,
//                               onPressed: () {
//                                 setState(() {
//                                  passport=20 ;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),*/
//                 Expanded(
//                   child: ReusableCard(
//                     color: kActiveCardColor,
//                     cardChild: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           ' certified language?',
//                           style: kLabelStyle,

//                         ),
//                          SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[
//                             RoundIconButton(
//                               icon: Icons.clear,
//                               onPressed: () {
//                                 setState(() {
//                                language=0;
//                                 });
//                               },
//                             ),

//                             RoundIconButton(
//                               icon: Icons.check,

//                               onPressed: () {
//                                 setState(() {
//                                 language=20;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//             Expanded(
//                   child: ReusableCard(
//                      color: kActiveCardColor,
//                     cardChild: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'PassPort?',
//                           style: kLabelStyle,
//                         ),
//                          SizedBox(height: 8),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[

//                             RoundIconButton(
//                               icon: Icons.clear,
//                               onPressed: () {
//                                 setState(() {
//                                     passport=0 ;
//                                 });
//                               },
//                             ),
//                             RoundIconButton(
//                               icon: Icons.check,
//                               onPressed: () {
//                                 setState(() {
//                                  passport=20 ;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//           Expanded(
//             child: ReusableCard(
//               color: kActiveCardColor,
//               cardChild: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'MONEY?',
//                     style: kLabelStyle,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline.alphabetic,
//                     children: <Widget>[
//                       Text(
//                         '$money',
//                         style: kNumberStyle,
//                       ),
//                       Text(
//                         'K\$',
//                         style: kLabelStyle,
//                       )
//                     ],
//                   ),
//                   SliderTheme(
//                     data: SliderTheme.of(context).copyWith(
//                         thumbShape:
//                             RoundSliderThumbShape(enabledThumbRadius: 15),
//                         overlayShape:
//                             RoundSliderOverlayShape(overlayRadius: 30),
//                         activeTrackColor: Colors.white,
//                         inactiveTrackColor: Color(0xff8d8e98),
//                         thumbColor: Color(0xffeb1555),
//                         overlayColor: Color(0x29eb1555)),
//                     child: Slider(
//                       value: money.toDouble(),
//                       min: 0.0,
//                       max: 300.0,
//                       onChanged: (newValue) {
//                         setState(() {
//                          money = newValue.round();
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//             Expanded(
//                   child: ReusableCard(
//                     color: kActiveCardColor,
//                     cardChild: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text(
//                           'AGE',
//                           style: kLabelStyle,
//                         ),
//                         Text(
//                           '$age',
//                           style: kNumberStyle,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: <Widget>[
//                             RoundIconButton(
//                               icon: Icons.remove,
//                               onPressed: () {
//                                 setState(() {
//                                   if (age > 1) age--;
//                                 });
//                               },
//                             ),
//                             RoundIconButton(
//                               icon: Icons.add,
//                               onPressed: () {
//                                 setState(() {
//                                   age++;
//                                 });
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//           BottomButton(
//             buttonTitle: 'SCORE',
//             onTap: () {
//               CalculatorBMI calc =
//                     CalculatorBMI(money: money, passport: passport, age: age,language: language, education: education );
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                     builder: (_) => ResultsPage(
//                           bmiResult: calc.getBMI(),
//                           resultText: calc.getResult(),
//                           interpretation: calc.getInterpretation(),
//                         )),
//               );
//             },
//           ),
//         ],
//       ),
//       ),
