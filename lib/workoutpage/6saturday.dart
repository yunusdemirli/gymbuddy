import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaturdayTraining extends StatefulWidget {
  const SaturdayTraining({super.key});

  @override
  State<SaturdayTraining> createState() => _SaturdayTrainingState();
}

class _SaturdayTrainingState extends State<SaturdayTraining> {
  final TextEditingController _trainingTitle6 = TextEditingController();
  String _title6 = '';

  @override
  void initState() {
    super.initState();
    _loadtitle6();
  }

  _loadtitle6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title6 = (prefs.getString('title6') ?? '');
      _trainingTitle6.text = _title6;
    });
  }

  _savetitle6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title6', _trainingTitle6.text);
    setState(() {
      _title6 = _trainingTitle6.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        const Text('  Saturday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        const Divider(
          color: Colors.indigo,
          thickness: 1,
        ),

        Row(
          children: [

            const SizedBox(width: 15,),

            Expanded(
              child: TextField(
                controller: _trainingTitle6,
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
          controller: _trainingTitle6,
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
              _savetitle6();
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