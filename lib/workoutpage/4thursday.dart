import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThursdayTraining extends StatefulWidget {
  const ThursdayTraining({super.key});

  @override
  State<ThursdayTraining> createState() => _ThursdayTrainingState();
}

class _ThursdayTrainingState extends State<ThursdayTraining> {
  final TextEditingController _trainingTitle4 = TextEditingController();
  String _title4 = '';

  @override
  void initState() {
    super.initState();
    _loadtitle4();
  }

  _loadtitle4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title4 = (prefs.getString('title4') ?? '');
      _trainingTitle4.text = _title4;
    });
  }

  _savetitle4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title4', _trainingTitle4.text);
    setState(() {
      _title4 = _trainingTitle4.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        const Text('  Thursday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        const Divider(
          color: Colors.indigo,
          thickness: 1,
        ),

        Row(
          children: [

            const SizedBox(width: 15,),

            Expanded(
              child: TextField(
                controller: _trainingTitle4,
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
          controller: _trainingTitle4,
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
              _savetitle4();
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