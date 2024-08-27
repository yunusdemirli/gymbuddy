import 'package:flutter/material.dart';

//  --- EXPLANATION ---
//  this class creates an AlertBox for user when he want to add an exercice in a
//  specific workout day. User can manage number of repetitions and a break timer.
//  -------------------
// ignore: must_be_immutable
class AddExerciceBox extends StatefulWidget {


  VoidCallback onSave;
  VoidCallback onCancel;

  AddExerciceBox({
    super.key,

    required this.onSave,
    required this.onCancel,
  });

  @override
  State<AddExerciceBox> createState() => _AddExerciceBoxState();
}

class _AddExerciceBoxState extends State<AddExerciceBox> {

  
  String? _selectedItem;

  //  list of workout where user can add an exercice
  final List<String> _options = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
    ];

  //  build method
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit the exercice'),
      content: SizedBox(
        height: 185,
        child: Column(
          children: [
            
            //  get number of repets
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of repetitions',
              ),
              onChanged: (value) {},
            ),

            const SizedBox(height: 10,),

            //  get break timer
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Timer',
              ),
              onChanged: (value) {},
            ),

            const SizedBox(height: 15,),

            //  select the day to add the exercice
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
        
        //  cancel button
        TextButton(
          onPressed: widget.onCancel,
          child: const Text("Cancel")
        ),

        //  save button
        TextButton(
          onPressed: widget.onSave,
          child: const Text("Save")
        ),
      ],
    );
  }
}