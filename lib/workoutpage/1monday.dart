import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MondayTraining extends StatefulWidget {
  const MondayTraining({super.key});

  @override
  State<MondayTraining> createState() => _MondayTrainingState();
}

class _MondayTrainingState extends State<MondayTraining> {
  final TextEditingController _trainingTitle1 = TextEditingController();
  String _title1 = '';

  @override
  void initState() {
    super.initState();
    _loadtitle1();
  }

  _loadtitle1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title1 = (prefs.getString('title1') ?? '');
      _trainingTitle1.text = _title1;
    });
  }

  _savetitle1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title1', _trainingTitle1.text);
    setState(() {
      _title1 = _trainingTitle1.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        const Text('  Monday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        const Divider(
          color: Colors.indigo,
          thickness: 1,
        ),

        Row(
          children: [

            const SizedBox(width: 15,),

            Expanded(
              child: TextField(
                controller: _trainingTitle1,
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
          controller: _trainingTitle1,
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
              _savetitle1();
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