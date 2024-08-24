import 'package:flutter/material.dart';
import 'package:gymbuddy_github/days_content/1monday.dart';
import 'package:gymbuddy_github/days_content/2tuesday.dart';
import 'package:gymbuddy_github/days_content/3wednesday.dart';
import 'package:gymbuddy_github/days_content/4thursday.dart';
import 'package:gymbuddy_github/days_content/5friday.dart';
import 'package:gymbuddy_github/days_content/6saturday.dart';
import 'package:gymbuddy_github/days_content/7sunday.dart';

class ListOfWorkout extends StatelessWidget {

  final String selectedDay;
  const ListOfWorkout({super.key, required this.selectedDay});

  Widget getDayContent() {
    switch (selectedDay) {
      case "Monday":
        return const MondayTraining();
      case "Tuesday":
        return const TuesdayTraining();
      case "Wednesday":
        return const WednesdayTraining();
      case "Thursday":
        return const ThursdayTraining();
      case "Friday":
        return const FridayTraining();
      case "Saturday":
        return const SaturdayTraining();
      case "Sunday":
        return const SundayTraining();
      default:
        return const Text("Unknown day");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  --- APPBAR ---
      appBar: AppBar(
        title: const Center(child: Text('GYMBUDDY', style: TextStyle(fontWeight: FontWeight.bold),)),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('data'),
                  action: SnackBarAction(label: 'undo', onPressed:() {},),
                  ),
                );
              },
            icon: const Icon(Icons.info_outlined),
            )
        ],
      ),

      //  --- BODY ---
      body: getDayContent(),
    );
  }
}