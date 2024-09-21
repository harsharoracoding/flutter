// Import necessary packages
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(primaryColor: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('FlutterforGeeks'),
        ),
        body: const MyAdvancedDropdown(),
      ),
    );
  }
}

class MyAdvancedDropdown extends StatefulWidget {
  const MyAdvancedDropdown({super.key});

  @override
  _MyAdvancedDropdownState createState() => _MyAdvancedDropdownState();
}

class _MyAdvancedDropdownState extends State<MyAdvancedDropdown> {
  String _selectedItem = "Option 1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: DropdownButtonFormField<String>(
          value: _selectedItem,
          onChanged: (String? value) {
            setState(() {
              _selectedItem = value!;
            });
          },
          decoration: const InputDecoration(
            labelText: 'Select an option',
            border: OutlineInputBorder(),
          ),
          items: [
            'Option 1',
            'Option 2',
            'Option 3',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  const Icon(Icons.star),
                  const SizedBox(width: 10),
                  Text(value),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}