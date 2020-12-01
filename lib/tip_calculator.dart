import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  TipCalculator({Key key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          Text('Bill amount - (editable widget)'),
          SizedBox(height: 25),
          Text('Tip Percentage - (editable widget)'),
          SizedBox(height: 25),
          Divider(),
          SizedBox(height: 25),
          Text('Tip Amount - (not editable widget)'),
          SizedBox(height: 25),
          Text('Total Amount - (not editable widget)')
        ],
      ),
    );
  }
}
