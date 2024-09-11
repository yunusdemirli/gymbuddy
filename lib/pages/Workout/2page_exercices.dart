//import required packages--------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_data/DataBase.dart';
import 'package:gymbuddy_github/pages/Workout/3select_exercices_page.dart';
import 'package:gymbuddy_github/pages/Workout/4valeur_exercice.dart';
import 'package:gymbuddy_github/pages/Workout/componants.dart';
//import required lib

//---------------------------------------------------------------------------------------

//PAGE EXERCICES CLASS-------------------------------------------------------------------
class PageExercices extends StatefulWidget {
  //import required variables------------------------------------------------------------
  final String name;
  final DataBase db;

  const PageExercices({
    super.key,
    required this.name,
    required this.db,
  });
  //-------------------------------------------------------------------------------------

  @override
  State<PageExercices> createState() => _PageExercicesState();
}

class _PageExercicesState extends State<PageExercices> {
  //import required variables------------------------------------------------------------
  late List<Map<String, String>> exercises;
  late String name;
  //-------------------------------------------------------------------------------------

  //function "title"---------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    name = widget.name;
    exercises = widget.db.WorkoutList[name] ?? [];
  }
  //-------------------------------------------------------------------------------------

  //function to add exercice-------------------------------------------------------------
  void AddExercice(String name, String image) {
    setState(() {
      exercises.add({name: image});
    });
    widget.db.UpdateData();
  }
  //-------------------------------------------------------------------------------------

  //function to delete exercice----------------------------------------------------------
  void DeleteExercice(int index) {
    setState(() {
      exercises.removeAt(index);
    });
    widget.db.UpdateData();
  }
  //-------------------------------------------------------------------------------------

  //method build-------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //button to add exercice-----------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        /*onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ExercicesPage(),
            ),
          ).then((selectedWorkout) {
            if (selectedWorkout != null) {
              AddExercice(selectedWorkout);
            }
          });
        },*/
        onPressed: () async {
          // Navigate to the page to select the exercise and wait for the result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExercicesPage(
                name: widget.name,
                db: widget.db,
                exercises: exercises,
              ),
            ),
          );
          if (result != null && result is Map<String, String>) {
            setState(() {
              print(result);
              // Add the returned exercise and image path to the list
              exercises.add({
                "Exercice": result['exercice']!, // Retrieve the exercise name
                "Image": result['image']!, // Retrieve the image path
              });
            });
          }
        },
      ),
      //---------------------------------------------------------------------------------

      //appbar---------------------------------------------------------------------------
      appBar: AppBar(
        //theme management
        foregroundColor: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade800,
        //----------------

        //appbar content
        title: const Center(
          child: Text(
            'GYMBUDDY',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.check_box_outline_blank,
                  color: Colors.grey.shade800))
        ],
      ),
      //---------------------------------------------------------------------------------

      //body of the page-----------------------------------------------------------------
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return LittleWorkout(
                  LittleWorkoutName:
                      exercises[index]['Exercice'] ?? 'Default Exercise Name',
                  deletelt: (context) => DeleteExercice(index),
                  tap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ValeurExercice(
                          exo: exercises[index]['Exercice'] ??
                              'Default Exercise Name',
                          db: widget.db,
                          workout: name,
                        ),
                      ),
                    );
                  },
                  imagePath:
                      exercises[index]['Image'] ?? 'Default Exercise Name',
                );
              },
            ),
          ),
        ],
      ),
      //---------------------------------------------------------------------------------
    );
  }
}
