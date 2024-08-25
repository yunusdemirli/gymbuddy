import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_days_widgets/week_days_title.dart';
import 'package:gymbuddy_github/_exercices_list_widgets/choose_your_exercice.dart';

class MondayTraining extends StatefulWidget {
  const MondayTraining({super.key});

  @override
  State<MondayTraining> createState() => _MondayTrainingState();
}

class _MondayTrainingState extends State<MondayTraining> {

  final TextEditingController _trainingTitle1 = TextEditingController();
  final String _title1 = '';
  final String _dataBaseTitle1 = 'title1';
  final String _weekDayTraining1 = 'Monday';

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
      
          WeekDaysTitle(
            trainingTitle: _trainingTitle1,
            title: _title1,
            dataBaseTitle: _dataBaseTitle1,
            weekDayTraining: _weekDayTraining1
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

                /*ListView.builder(
                  itemBuilder: itemBuilder
                ),*/

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo[200],
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  width: 350,
                  child: Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {} ),
                      const Text('data', style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ),


              ],
            ),
          ),
        ]
      ),
    );
  }
}