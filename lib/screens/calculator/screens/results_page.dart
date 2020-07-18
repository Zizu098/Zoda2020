import 'package:zoda/screens/calculator/components/reusable_card.dart';
import 'package:zoda/screens/calculator/constants.dart';
import 'package:zoda/screens/calculator/screens/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final int bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SCORE'),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              color: Colors.amber[700],
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: weightColor[resultText],
                    ),
                  ),
                  Text(
                     bmiResult.toString(),
                    style: kBMIStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
         
        ],
      ),
       bottomNavigationBar: SizedBox(
          height: 70,
          child: RaisedButton(
            child: Text('RE-SCORE',
                style: TextStyle(fontSize: 35, fontFamily: 'RobotoMono')),
            color: Colors.amber[700],
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
    );
  }
}
