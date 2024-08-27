import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_days_widgets/week_days_title.dart';
import 'package:gymbuddy_github/_exercices_list_widgets/choose_your_exercice.dart';
import 'package:gymbuddy_github/_exercices_list_widgets/exercice_container.dart';

class MondayTraining extends StatefulWidget {
  const MondayTraining({super.key});

  @override
  State<MondayTraining> createState() => _MondayTrainingState();
}

class _MondayTrainingState extends State<MondayTraining> {

  //  variables required
  final TextEditingController _trainingTitle1 = TextEditingController();
  final String _title1 = '';
  final String _dataBaseTitle1 = 'title1';
  final String _weekDayTraining1 = 'Monday';

  List<String> mondayExercices = [
    "data1",
    "data2",
    "data3",
  ];

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          
          //  create title part of the page
          WeekDaysTitle(
            trainingTitle: _trainingTitle1,
            title: _title1,
            dataBaseTitle: _dataBaseTitle1,
            weekDayTraining: _weekDayTraining1
          ),
      
          const SizedBox(height: 25,),
      
          //  container allows to add exercices and show them
          Container(
            margin: const EdgeInsets.all(7),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15,),

                //  add exercices button
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

                //  divider    
                const Divider(
                  color: Colors.white,
                ),
                      
                const SizedBox(height: 25,),

                //  list of exercices added
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: mondayExercices.length,
                    itemBuilder: (context, index) {
                      return ExerciceContainer(containerName: mondayExercices[index]);
                    }
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