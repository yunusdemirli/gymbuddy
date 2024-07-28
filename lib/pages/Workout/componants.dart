//import required packages---------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//---------------------------------------------------------------------------------------

//WORKOUT CLASS--------------------------------------------------------------------------
class Workout extends StatelessWidget {
  //import required variables------------------------------------------------------------
  final String WorkoutName;
  final VoidCallback delete;
  final VoidCallback tap;

  const Workout({
    super.key,
    required this.WorkoutName,
    required this.delete,
    required this.tap,
  });
  //-------------------------------------------------------------------------------------

  //method build-------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      onDoubleTap: delete,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              WorkoutName,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
  //-------------------------------------------------------------------------------------
}

//LITTLE WORKOUT CLASS-------------------------------------------------------------------
class LittleWorkout extends StatelessWidget {
  //import required variables------------------------------------------------------------
  final String LittleWorkoutName;
  final Function(BuildContext)? deletelt;
  final VoidCallback tap;
  final String imagePath;

  const LittleWorkout({
    super.key,
    required this.LittleWorkoutName,
    required this.deletelt,
    required this.tap,
    required this.imagePath,
  });
  //-------------------------------------------------------------------------------------

  //method build-------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletelt,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 37, 2, 79),
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          child: Row(
            // Use Row widget to align the image and text horizontally
            children: [
              // Image widget to display the image
              Image.asset(
                imagePath, // Use your image variable here
                width: 50, // Adjust the width as needed
                height: 50, // Adjust the height as needed
              ),
              const SizedBox(
                width: 10,
              ), // Add some spacing between the image and text
              // Text widget to display the workout name
              Text(
                LittleWorkoutName, // Display the workout name
                style: const TextStyle(color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//LIST EXERCICE CLASS--------------------------------------------------------------------
class ListExercice extends StatelessWidget {
  //import required variables------------------------------------------------------------
  final String poids;
  final String reps;
  final Function(BuildContext)? deletelt;

  const ListExercice({
    super.key,
    required this.poids,
    required this.reps,
    required this.deletelt,
  });
  //-------------------------------------------------------------------------------------

  //method build-------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deletelt,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 37, 2, 79),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$reps REPS', // Example value, replace with the actual reps value
              style: const TextStyle(color: Colors.amber),
            ),
            Text(
              '$poids KG', // Example value, replace with the actual poids value
              style: const TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
  //-------------------------------------------------------------------------------------
}
