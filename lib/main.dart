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
  String? _convertedMeasure;

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
      debugShowCheckedModeBanner: false,
      title: 'Measure Converter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Measue Converter'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Spacer(),
                    Text(
                      'Value',
                      style: labelStyle,
                    ),
                    const Spacer(),
                    TextField(
                      style: inputStyle,
                      decoration: const InputDecoration(
                        hintText: "Please insert the measeure to be converted",
                      ),
                      onChanged: (value) {
                        var rv = double.tryParse(value);
                        setState(() {
                          _numberFrom = rv;
                        });
                      },
                    ),
                    const Spacer(),
                    Text(
                      'From',
                      style: labelStyle,
                    ),
                    DropdownButton(
                      isExpanded: true,
                      style: inputStyle,
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
                    const Spacer(),
                    Text(
                      'To',
                      style: labelStyle,
                    ),
                    DropdownButton(
                      isExpanded: true,
                      style: inputStyle,
                      value: _convertedMeasure,
                      items: _measures.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _convertedMeasure = value;
                        });
                      },
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    ElevatedButton(
                      onPressed: () => true,
                      child: Text(
                        'Convert',
                        style: inputStyle,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      (_numberFrom == null) ? '' : _numberFrom.toString(),
                      style: labelStyle,
                    ),
                    const Spacer(
                      flex: 8,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
