import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SundayTraining extends StatefulWidget {
  const SundayTraining({super.key});

  @override
  State<SundayTraining> createState() => _SundayTrainingState();
}

class _SundayTrainingState extends State<SundayTraining> {
  final TextEditingController _trainingTitle7 = TextEditingController();
  String _title7 = '';

  @override
  void initState() {
    super.initState();
    _loadtitle7();
  }

  _loadtitle7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title7 = (prefs.getString('title7') ?? '');
      _trainingTitle7.text = _title7;
    });
  }

  _savetitle7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title7', _trainingTitle7.text);
    setState(() {
      _title7 = _trainingTitle7.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        const Text('  Sunday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        const Divider(
          color: Colors.indigo,
          thickness: 1,
        ),

        Row(
          children: [

            const SizedBox(width: 15,),

            Expanded(
              child: TextField(
                controller: _trainingTitle7,
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
          controller: _trainingTitle7,
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
              _savetitle7();
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