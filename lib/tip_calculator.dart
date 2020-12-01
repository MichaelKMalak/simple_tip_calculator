import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  TipCalculator({Key key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  static const double initialBillAmount = 0;
  static const double initialTipPercentage = 15;

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
          TextFormField(
            initialValue: initialBillAmount.toString(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (String value){},
            decoration: InputDecoration(
              hintText: 'Enter the Bill Amount',
              labelText: 'Bill Amount',
            ),
          ),
          SizedBox(height: 25),
          TextFormField(
            initialValue: initialTipPercentage.toString(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (String value){},
            decoration: InputDecoration(
              hintText: 'Enter the Tip Percentage',
              labelText: 'Tip Percentage',
            ),
          ),
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
