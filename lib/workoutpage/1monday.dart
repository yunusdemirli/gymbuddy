import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MondayTraining extends StatefulWidget {
  const MondayTraining({super.key});

  @override
  State<MondayTraining> createState() => _MondayTrainingState();
}

class _MondayTrainingState extends State<MondayTraining> {
  final TextEditingController _bioController = TextEditingController();
  String _bio = '';

  @override
  void initState() {
    super.initState();
    _loadBio();
  }

  // Load bio from shared preferences
  _loadBio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _bio = (prefs.getString('bio') ?? 'Your bio here...');
      _bioController.text = _bio;
    });
  }

  // Save bio to shared preferences
  _saveBio() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('bio', _bioController.text);
    setState(() {
      _bio = _bioController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        const Text('   Monday Training', style: TextStyle(fontSize: 22),),

        const Divider(
          color: Colors.black,
          thickness: 1,
        ),

        Row(
          children: [

            const SizedBox(width: 15),

            Expanded(
              child: TextField(
                controller: _bioController,
                decoration: const InputDecoration(border: InputBorder.none),
                style: const TextStyle(fontSize: 20, color: Colors.indigo),
                readOnly: true,
              )
            ),

            IconButton(
              onPressed: () {
                _showEditDialog(context);
              },
              icon: const Icon(Icons.edit, color: Colors.indigo,),
            ),

          ],
        ),
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
          controller: _bioController,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Enter your bio'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _saveBio();
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      );
    }
  );
}
}

