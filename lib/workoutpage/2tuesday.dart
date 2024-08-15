import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TuesdayTraining extends StatefulWidget {
  const TuesdayTraining({super.key});

  @override
  State<TuesdayTraining> createState() => _TuesdayTrainingState();
}

class _TuesdayTrainingState extends State<TuesdayTraining> {
  final TextEditingController _trainingTitle2 = TextEditingController();
  String _title2 = '';

  @override
  void initState() {
    super.initState();
    _loadtitle2();
  }

  _loadtitle2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title2 = (prefs.getString('title2') ?? '');
      _trainingTitle2.text = _title2;
    });
  }

  _savetitle2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title2', _trainingTitle2.text);
    setState(() {
      _title2 = _trainingTitle2.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        const Text('  Tuesday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        const Divider(
          color: Colors.indigo,
          thickness: 1,
        ),

        Row(
          children: [

            const SizedBox(width: 15,),

            Expanded(
              child: TextField(
                controller: _trainingTitle2,
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
          controller: _trainingTitle2,
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
              _savetitle2();
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