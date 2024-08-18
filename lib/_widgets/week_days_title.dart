import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class WeekDaysBody extends StatefulWidget {
  TextEditingController trainingTitle = TextEditingController();
  String title = '';
  String dataBaseTitle = '';
  String weekDayTraining = '';
  WeekDaysBody({super.key, required this.trainingTitle, required this.title, required this.dataBaseTitle, required this.weekDayTraining});

  @override
  State<WeekDaysBody> createState() => _WeekDaysBodyState();
}

class _WeekDaysBodyState extends State<WeekDaysBody> {


  @override
  void initState() {
    super.initState();
    _loadtitle();
  }

  _loadtitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.title = (prefs.getString(widget.dataBaseTitle) ?? '');
      widget.trainingTitle.text = widget.title;
    });
  }

  _savetitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(widget.dataBaseTitle, widget.trainingTitle.text);
    setState(() {
      widget.title = widget.trainingTitle.text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),

        Text('  ${widget.weekDayTraining} Training', style: const TextStyle(fontSize: 25, color: Colors.indigo),),

        const SizedBox(height: 15,),

        Row(
          children: [

            const SizedBox(width: 15,),

            Expanded(
              child: TextField(
                controller: widget.trainingTitle,
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
        ),

        const Divider(
          color: Colors.indigo,
          thickness: 1,
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
            controller: widget.trainingTitle,
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
                _savetitle();
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