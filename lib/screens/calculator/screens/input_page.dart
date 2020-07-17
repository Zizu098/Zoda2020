import 'package:zoda/screens/calculator/calculator_BMI.dart';
import 'package:zoda/screens/calculator/components/reusable_card.dart';
import 'package:zoda/screens/calculator/components/round_icon_button.dart';
import 'package:zoda/screens/calculator/constants.dart';
import 'package:zoda/screens/calculator/screens/bottom_button.dart';
import 'package:zoda/screens/calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
     int money = 20, passport = 20, age = 20, education=20 ,language=20 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCORE'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
               /* Expanded(
                  child: ReusableCard(
                     color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PassPort?',
                          style: kLabelStyle,
                        ),
                         SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            RoundIconButton(
                              icon: Icons.clear,
                              onPressed: () {
                                setState(() {
                                    passport=0 ;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.check,
                              onPressed: () {
                                setState(() {
                                 passport=20 ;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),*/
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          ' certified language?',
                          style: kLabelStyle,
                        ),
                         SizedBox(height: 25),       
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.clear,
                              onPressed: () {
                                setState(() {
                               language=0;
                                });
                              },
                            ),
                           
                            RoundIconButton(
                              icon: Icons.check,
                              
                              onPressed: () {
                                setState(() {
                                language=20;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
            Expanded(
                  child: ReusableCard(
                     color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PassPort?',
                          style: kLabelStyle,
                        ),
                         SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            RoundIconButton(
                              icon: Icons.clear,
                              onPressed: () {
                                setState(() {
                                    passport=0 ;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.check,
                              onPressed: () {
                                setState(() {
                                 passport=20 ;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),



                  
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'MONEY?',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$money',
                        style: kNumberStyle,
                      ),
                      Text(
                        'K\$',
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555)),
                    child: Slider(
                      value: money.toDouble(),
                      min: 0.0,
                      max: 300.0,
                      onChanged: (newValue) {
                        setState(() {
                         money = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Education?',
                          style: kLabelStyle,
                        ),
                         SizedBox(height: 10),
                          Column(
                          children: <Widget>[

                                      ButtonTheme(
                                         padding: EdgeInsets.all(10.0),
                                        minWidth: 50,
                                        height: 20,
                                       child: RaisedButton(
                                           textColor: Colors.white,
                                           color: Colors.blueGrey,
                                           child: Text("PHD"),
                                              onPressed: () {
                                                setState(() {
                                                   education=15;
                                                       });
                                              },
                                             shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0),
                                             ),
                                           
                                           ),
                                    
                                     ),
                  
                                    Row(
                                      children: <Widget>[
                                        SizedBox(
                                    width: 20,
                                  ),
                                        ButtonTheme( 
                                          padding: EdgeInsets.all(10.0),                                    
                                        minWidth: 50,
                                        height: 20,
                                       child: RaisedButton(
                                           textColor: Colors.white,
                                           color: Colors.blueGrey,
                                           child: Text("SEC"),
                                              onPressed: () {
                                                   setState(() {
                                                   education=10;
                                                       });
                                              },
                                             shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(10.0),
                                             ),
                                           ),
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  ButtonTheme(
                                      padding: EdgeInsets.all(8.0),
                                        minWidth: 50,
                                        height: 20,
                                       child: RaisedButton(
                                           textColor: Colors.white,
                                           color: Colors.blueGrey,
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
                                  ),
                                      ],
                                  ),
                          ]
                          ),
                          ],
                        ),
                    ),
                  ),
                
               /* Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),*/
              ],
            ),
          ),
           
            Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


          BottomButton(
            buttonTitle: 'SCORE',
            onTap: () {
              CalculatorBMI calc =
                    CalculatorBMI(money: money, passport: passport, age: age,language: language, education: education ); 
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
        ],
      ),
      ),
    );
  }
}
