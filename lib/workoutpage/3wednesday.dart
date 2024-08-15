import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WednesdayTraining extends StatefulWidget {
  const WednesdayTraining({super.key});

  @override
  State<WednesdayTraining> createState() => _WednesdayTrainingState();
}

class _WednesdayTrainingState extends State<WednesdayTraining> {
  final TextEditingController _trainingTitle3 = TextEditingController();
  String _title3 = '';

  @override
  void initState() {
    super.initState();
    _loadtitle3();
  }

  _loadtitle3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _title3 = (prefs.getString('title3') ?? '');
      _trainingTitle3.text = _title3;
    });
  }

  _savetitle3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('title3', _trainingTitle3.text);
    setState(() {
      _title3 = _trainingTitle3.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        const Text('  Wednesday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        const Divider(
          color: Colors.indigo,
          thickness: 1,
        ),

        Row(
          children: [

            const SizedBox(width: 15,),

            Expanded(
              child: TextField(
                controller: _trainingTitle3,
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
          controller: _trainingTitle3,
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
              _savetitle3();
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