import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  TipCalculator({Key key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  static const double initialBillAmount = 0;
  static const double initialTipPercentage = 15;

  double _billAmount = initialBillAmount;
  double _tipPercentage = initialTipPercentage;

  double get _tipAmount => _billAmount * _tipPercentage / 100;
  double get _totalAmount => _billAmount + _tipAmount;

  String get _tipAmountString => _tipAmount.toStringAsFixed(2);
  String get _totalAmountString => _totalAmount.toStringAsFixed(2);

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
            onChanged: _onBillAmountChanged,
            decoration: InputDecoration(
              hintText: 'Enter the Bill Amount',
              labelText: 'Bill Amount',
            ),
          ),
          SizedBox(height: 25),
          TextFormField(
            initialValue: initialTipPercentage.toString(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: _onTipAmountChanged,
            decoration: InputDecoration(
              hintText: 'Enter the Tip Percentage',
              labelText: 'Tip Percentage',
            ),
          ),
          SizedBox(height: 25),
          Divider(),
          SizedBox(height: 25),
          ListTile(
            title: Text('Tip Amount'),
            trailing: Text('\$$_tipAmountString'),
            contentPadding: EdgeInsets.zero,
          ),
          ListTile(
            title: Text('Total Amount'),
            trailing: Text('\$' + _totalAmountString),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
  void _onBillAmountChanged(String value) {
    setState(() {
      _billAmount = double.tryParse(value) ?? 0.0;
    });
  }

  void _onTipAmountChanged(String value) {
    setState(() {
      _tipPercentage = double.tryParse(value) ?? 0.0;
    });
  }
}
