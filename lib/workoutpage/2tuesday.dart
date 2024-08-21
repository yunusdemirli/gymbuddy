import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_widgets/week_days_title.dart';
import 'package:gymbuddy_github/workoutpage/choose_your_exercice.dart';

class TuesdayTraining extends StatefulWidget {
  const TuesdayTraining({super.key});

  @override
  State<TuesdayTraining> createState() => _TuesdayTrainingState();
}

class _TuesdayTrainingState extends State<TuesdayTraining> {
  final TextEditingController _trainingTitle2 = TextEditingController();
  final String _title2 = '';
  final String _dataBaseTitle2 = 'title2';
  final String _weekDayTraining2 = 'Tuesday';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
      
          WeekDaysTitle(
            trainingTitle: _trainingTitle2,
            title: _title2,
            dataBaseTitle: _dataBaseTitle2,
            weekDayTraining: _weekDayTraining2
          ),
      
          const SizedBox(height: 25,),
      
          Container(
            margin: const EdgeInsets.all(7),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(height: 15,),
                Row(
                  children: [
                    const Text('   Add exercices', style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),),
                    const Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.indigo,
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseYourExercicePage()));
                      },
                      child: const Icon(Icons.add, size: 40,),
                    ),
                    const SizedBox(width: 50,)
                  ],
                ),

                const SizedBox(height: 15,),

                const Divider(
                  color: Colors.white,
                ),

                const SizedBox(height: 25,),
              ],
            ),
          ),
        ]
      ),
    );
  }
}