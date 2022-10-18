import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double? _numberFrom;

  String? _startMeasure;

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces'
  ];

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey[700],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Measure Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measue Converter'),
        ),
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              TextField(
                onChanged: (value) {
                  var rv = double.tryParse(value);
                  setState(() {
                    _numberFrom = rv;
                  });
                },
                style: inputStyle,
              ),
              DropdownButton(
                value: _startMeasure,
                items: _measures.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _startMeasure = value;
                  });
                },
              ),
              Text(
                (_numberFrom == null) ? '' : _numberFrom.toString(),
                style: labelStyle,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
