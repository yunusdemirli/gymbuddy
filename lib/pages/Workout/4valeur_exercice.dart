import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_data/DataBase.dart';
import 'package:gymbuddy_github/calculate.dart';
import 'package:gymbuddy_github/pages/Workout/componants.dart';

class ValeurExercice extends StatefulWidget {
  final DataBase db;
  final String exo;
  final String workout;

  const ValeurExercice({
    super.key,
    required this.exo,
    required this.db,
    required this.workout,
  });

  @override
  State<ValeurExercice> createState() => _ValeurExercieState();
}

class _ValeurExercieState extends State<ValeurExercice> {
  @override
  void initState() {
    if (widget.db.mybox.get("LIST${widget.workout}${widget.exo}") == null) {
      log('A');
      widget.db.createInitData1();
    } else {
      widget.db.LoadData1(widget.workout, widget.exo);
    }
    super.initState();
  }

  void _openCalculatorBottomSheet() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CalculatorBottomSheet();
      },
    );
    if (result != null) {
      String weight = result['weight'];
      String reps = result['reps'];
      if (weight != '' || reps != '') {
        addExercice(weight, reps);
      }
      log('Weight: $weight, Reps: $reps');
    }
  }

  void DeleteExercice(int index) {
    setState(() {
      widget.db.valeursList.removeAt(index);
    });
    widget.db.UpdateData1(widget.workout, widget.exo);
  }

  void addExercice(String poids, String reps) {
    String date = DateTime.now().toIso8601String().split('T').first;
    setState(() {
      widget.db.valeursList.add({'date': date, 'poids': poids, 'reps': reps});
    });
    widget.db.UpdateData1(widget.workout, widget.exo);
  }

  void modifyExercice(int index) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const CalculatorBottomSheet();
      },
    );
    if (result != null) {
      String weight = result['weight'];
      String reps = result['reps'];
      if (weight != '' || reps != '') {
        setState(() {
          if (index >= 0 && index < widget.db.valeursList.length) {
            widget.db.valeursList[index]['poids'] = weight;
            widget.db.valeursList[index]['reps'] = reps;
          } else {
            // Handle index out of bounds error or any other appropriate action
          }
        });
      }
    }
    widget.db.UpdateData1(widget.workout, widget.exo);
  }

  @override
  Widget build(BuildContext context) {
    // Group exercises by date
    Map<String, List<Map<String, dynamic>>> groupedByDate = {};

    for (var entry in widget.db.valeursList) {
      String date = entry['date'];
      if (!groupedByDate.containsKey(date)) {
        groupedByDate[date] = [];
      }
      groupedByDate[date]!.add(entry);
    }

    return Scaffold(
      appBar: AppBar(
        //theme management
        foregroundColor: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade800,
        //----------------

        //appbar content
        title: Center(
          child: Text(
            widget.exo,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: _openCalculatorBottomSheet,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          child: const Icon(
            Icons.add,
            size: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.edit,
                size: 40,
              ),
              color: Theme.of(context).colorScheme.tertiary,
              onPressed: () {
                // Action du bouton de menu
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.access_alarm,
                size: 40,
              ),
              color: Theme.of(context).colorScheme.tertiary,
              onPressed: () {
                // Action du bouton de recherche
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: groupedByDate.keys.length,
              itemBuilder: (context, index) {
                String date = groupedByDate.keys.elementAt(index);
                List<Map<String, dynamic>> exercises = groupedByDate[date]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "BLABLA",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ...exercises.map((exercise) {
                      String poids = exercise['poids']!;
                      String reps = exercise['reps']!;
                      int exerciseIndex =
                          widget.db.valeursList.indexOf(exercise);

                      return GestureDetector(
                        onTap: () => modifyExercice(exerciseIndex),
                        onDoubleTap: () => DeleteExercice(exerciseIndex),
                        child: ListExercice(
                          poids: poids,
                          reps: reps,
                          deletelt: (context) => DeleteExercice(exerciseIndex),
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
