import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_exercices_list_widgets/add_exercice_box.dart';

class BardellBenchPress extends StatefulWidget {
  const BardellBenchPress({super.key});

  @override
  State<BardellBenchPress> createState() => _BardellBenchPressState();
}

class _BardellBenchPressState extends State<BardellBenchPress> {
  final TextEditingController _repetitions = TextEditingController();
  final TextEditingController _timer = TextEditingController();
  final String bardellBenchPressTitle = 'Bardell bench press';

  //  create new exerciceee
  void createNewExercice () {
    showDialog(
      context: context,
      builder: (context) {
        return AddExerciceBox(
          onSave: saveNewExercice,
          onCancel: Navigator.of(context).pop,
        );
      }
    );
  }

  //  save new exercice
  void saveNewExercice() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      body: SingleChildScrollView(
        child: Column(
          children: [

          const SizedBox(height: 20),

          Row(
            children: [
              const SizedBox(width: 25,),

              Text(bardellBenchPressTitle, style: const TextStyle(fontSize: 22, color: Colors.indigo),),
              
              const Spacer(),

              SizedBox(
                width: 80,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    createNewExercice();
                  },
                  child: const Icon(Icons.add, size: 30),
                ),
              ),

              const SizedBox(width: 25,),
            ],
          ),

          const SizedBox(height: 50),

          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: const Center(child: Text('exercice illustration with a carousel slider', style: TextStyle(color: Colors.white),)),
          ),

          const SizedBox(height: 50),

          ],
        ),
      )
    );
  }
}