import 'package:flutter/material.dart';

void main() {
  runApp(ElectronicsApp());
}

class ElectronicsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Resistance Calculator'),
        ),
        body: ResistanceCalculator(),
      ),
    );
  }
}

class ResistanceCalculator extends StatefulWidget {
  @override
  _ResistanceCalculatorState createState() => _ResistanceCalculatorState();
}

class _ResistanceCalculatorState extends State<ResistanceCalculator> {
  double voltage = 0.0;
  double current = 0.0;
  double resistance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Resistance Calculator',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              _showInputFields();
            },
            child: Text('Calculate Resistance'),
          ),
          SizedBox(height: 40),
          Text(
            'Result: $resistance ohms',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _showInputFields() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Voltage and Current'),
          content: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Voltage (V)'),
                onChanged: (value) {
                  voltage = double.tryParse(value) ?? 0.0;
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Current (A)'),
                onChanged: (value) {
                  current = double.tryParse(value) ?? 0.0;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  resistance = _calculateResistance(voltage, current);
                });
                Navigator.of(context).pop();
              },
              child: Text('Calculate'),
            ),
          ],
        );
      },
    );
  }

  double _calculateResistance(double voltage, double current) {
    if (current != 0.0) {
      return voltage / current;
    } else {
      return 0.0;
    }
  }
}
