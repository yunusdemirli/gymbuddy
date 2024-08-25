import 'package:flutter/material.dart';

class AddExerciceBox extends StatefulWidget {
  const AddExerciceBox({super.key});

  @override
  State<AddExerciceBox> createState() => _AddExerciceBoxState();
}

class _AddExerciceBoxState extends State<AddExerciceBox> {
  String? _selectedItem;

  final List<String> _options = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
    ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit the exercice'),
      content: SizedBox(
        height: 175,
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Number of repetitions',
              ),
              onChanged: (value) {},
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Timer',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 15,),
            DropdownButton<String>(
              hint: const Text('Select the day of workout'),
              value: _selectedItem,
              items: _options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              }
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();  
          },
          child: const Text("Cancel")
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();  
          },
          child: const Text("Save")
        ),
      ],
    );
  }
}