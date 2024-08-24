import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_exercices_list_widgets/exercice_category_list.dart';

class ChooseYourExercicePage extends StatelessWidget {
  const ChooseYourExercicePage({super.key});

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

      body: const SingleChildScrollView(child: ExerciceCategoryList()),
    );
  }
}