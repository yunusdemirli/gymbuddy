//required packages--------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/abdos/abdos_exercices/abs_exercice1.dart';
//-------------------------------------------------------------------------------------------

//DELTOID CLASS------------------------------------------------------------------------------
class Deltoid extends StatefulWidget {
  const Deltoid({super.key});

  @override
  State<Deltoid> createState() => _DeltoidState();
}

class _DeltoidState extends State<Deltoid> {
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
