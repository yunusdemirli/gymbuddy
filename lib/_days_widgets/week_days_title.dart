import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//  --- EXPLANATION ---
//  this class manages the few lines of the upper parts of each daily training, those
//  lines show the day of the week and allow to change the training title of each day.
//  -------------------
// ignore: must_be_immutable
class WeekDaysTitle extends StatefulWidget {
  
  //  variables
  TextEditingController trainingTitle = TextEditingController();
  String title = '';              //  default title of the training
  String dataBaseTitle = '';      //  database name
  String weekDayTraining = '';    //  day of the week for each training

  WeekDaysTitle({
    super.key,
    required this.trainingTitle,
    required this.title,
    required this.dataBaseTitle,
    required this.weekDayTraining
  });

  @override
  State<WeekDaysTitle> createState() => _WeekDaysTitleState();
}

class _WeekDaysTitleState extends State<WeekDaysTitle> {

  //  initState sharedpreferences method
  @override
  void initState() {
    super.initState();
    _loadtitle();
  }

  //  load training name's data from the database using sharedpreferences
  _loadtitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.title = (prefs.getString(widget.dataBaseTitle) ?? '');
      widget.trainingTitle.text = widget.title;
    });
  }

  //  allow string wrote by the user stored in the database with his specific data title
  _savetitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(widget.dataBaseTitle, widget.trainingTitle.text);
    setState(() {
      widget.title = widget.trainingTitle.text;
    });
  }

  //  function showing the alertdialog allowing user the write his training name
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
            
            //  cancel button
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  
              },
              child: const Text("Cancel")
            ),

            //  save button
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

  //  build method
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 20,),

        //  training day
        Text('  ${widget.weekDayTraining} Training', style: const TextStyle(fontSize: 25, color: Colors.indigo),),

        const SizedBox(height: 15,),

        //  custom training title
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
}