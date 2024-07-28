//required packages--------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/abdos/abdos_exercices/abs_exercice1.dart';

//-------------------------------------------------------------------------------------------

//BICEPS_TRICEPS CLASS------------------------------------------------------------------------------
class BicepsTriceps extends StatefulWidget {
  const BicepsTriceps({super.key});

  @override
  State<BicepsTriceps> createState() => _BicepsTricepsState();
}

class _BicepsTricepsState extends State<BicepsTriceps> {
  //method go to first ----------------------------------------------------------------------
  void firstexercice() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AbdosExercice1()),
    );
  }
  //-----------------------------------------------------------------------------------------

  //method build-----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.list),
            title: Text('Item $index'),
            subtitle: Text('Sous-title $index'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: firstexercice,
          );
        },
      ),
    );
  }
}
