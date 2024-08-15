import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FridayTraining extends StatefulWidget {
  const FridayTraining({super.key});

  @override
  State<FridayTraining> createState() => _FridayTrainingState();
}

class _FridayTrainingState extends State<FridayTraining> {
  final TextEditingController _trainingTitle5 = TextEditingController();
  String _title5 = '';

  @override
  void initState() {
    super.initState();
    _loadtitle5();
  }

  _loadtitle5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title5 = (prefs.getString('title5') ?? '');
      _trainingTitle5.text = _title5;
    });
  }

  _savetitle5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title5', _trainingTitle5.text);
    setState(() {
      _title5 = _trainingTitle5.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        const Text('  Friday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        const Divider(
          color: Colors.indigo,
          thickness: 1,
        ),

        Row(
          children: [

            const SizedBox(width: 15,),

            Expanded(
              child: TextField(
                controller: _trainingTitle5,
                decoration: const InputDecoration(border: InputBorder.none, hintText: "Training title..."),
                style: const TextStyle(fontSize: 20, color: Colors.indigo),
                readOnly: true,
              )
            ),

            IconButton(
              onPressed: () {
                _showEditDialog(context);
              },
              icon: const Icon(Icons.edit, color: Colors.indigo,)
            )
          ],
        )
      ],
    );
  }


  void _showEditDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit training title'),
        content: TextField(
          controller: _trainingTitle5,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Enter your training title'),
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
              _savetitle5();
              Navigator.of(context).pop();  
            },
            child: const Text("Save")
          ),
        ],
      );
    }
  );
}
}