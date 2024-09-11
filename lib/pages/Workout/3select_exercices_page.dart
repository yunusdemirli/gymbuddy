//import required packages---------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_data/DataBase.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/abdos/abdos_page.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/biceps_triceps/biceps_triceps_page.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/deltoid.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/dorsals.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/legs.dart';
//import required lib

//---------------------------------------------------------------------------------------

class ExercicesPage extends StatefulWidget {
  final String name;
  final DataBase db;
  final List<Map<String, String>> exercises;

  const ExercicesPage({
    super.key,
    required this.name,
    required this.db,
    required this.exercises,
  });

  @override
  State<ExercicesPage> createState() => _ExercicesPageState();
}

class _ExercicesPageState extends State<ExercicesPage> {
  //method build-------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    final String name = widget.name;
    final List<Map<String, String>> exercises = widget.exercises;
    return Scaffold(

        //app bar------------------------------------------------------------------------------
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
                onPressed: () {
                  final snackBar = SnackBar(
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    content: const Text(
                        'Welcome to GymBuddy !\n  For more information visit or social network :\n  Instagram : GymBuddy_Team\n  Facebook : GymBuddy_on_FB\n  For any question, contact us : gymbuddy_project@gmail.com'),
                    action: SnackBarAction(
                      label: 'Undo',
                      textColor: Theme.of(context).colorScheme.surface,
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: const Icon(Icons.info_outlined))
          ],
        ),
        //----------------------------------------------------------------------------------

        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //exercices title
                ListTile(
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  title: const Text(
                    'Exercices',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),

                //---
                const SizedBox(
                  height: 35,
                ),

                //exercices abdos
                ExpansionTile(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  collapsedIconColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  title: Center(
                      child: Text(
                    'Abdos',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20),
                  )),
                  leading: ClipOval(
                      child: Image.asset('assets/mountain_climber.jpg')),
                  children: const [
                    Abdos(),
                  ],
                ),

                //---
                const SizedBox(
                  height: 35,
                ),

                //exercices deltoid
                ExpansionTile(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  collapsedIconColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  title: Center(
                      child: Text(
                    'Deltoid',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20),
                  )),
                  leading: ClipOval(child: Image.asset('assets/shoulders.png')),
                  children: const [
                    Deltoid(),
                  ],
                ),

                //---
                const SizedBox(
                  height: 35,
                ),

                //exercices biceps and triceps
                ExpansionTile(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  collapsedIconColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  title: Center(
                      child: Text(
                    'Biceps and Triceps',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20),
                  )),
                  leading: ClipOval(child: Image.asset('assets/biceps.jpg')),
                  children: const [
                    BicepsTriceps(),
                  ],
                ),

                //---
                const SizedBox(
                  height: 35,
                ),

                //exercices dorsals
                ExpansionTile(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  iconColor: Theme.of(context).colorScheme.inversePrimary,
                  collapsedIconColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  title: Center(
                      child: Text(
                    'Dorsals',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20),
                  )),
                  leading: ClipOval(child: Image.asset('assets/dorsals.jpg')),
                  children: const [
                    Dorsals(),
                  ],
                ),

                //---
                const SizedBox(
                  height: 35,
                ),

                //exercices legs
                ExpansionTile(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.inversePrimary,
                  collapsedIconColor:
                      Theme.of(context).colorScheme.inversePrimary,
                  title: Center(
                      child: Text(
                    'Legs',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 20),
                  )),
                  leading: ClipOval(child: Image.asset('assets/legs.jpg')),
                  children: const [
                    Legs(),
                  ],
                ),

                //---
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ));
  }
}
