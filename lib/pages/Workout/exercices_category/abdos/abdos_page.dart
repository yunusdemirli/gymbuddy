//required packages--------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/abdos/abdos_exercices/abs_exercice1.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/abdos/abdos_exercices/abs_exercice2.dart';
//-------------------------------------------------------------------------------------------

//ABDOS CLASS--------------------------------------------------------------------------------
class Abdos extends StatefulWidget {
  const Abdos({super.key});

  @override
  State<Abdos> createState() => _AbdosState();
}

class _AbdosState extends State<Abdos> {
  //method go to first ----------------------------------------------------------------------
  void firstexercice() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AbdosExercice1()),
    );
  }
  //-----------------------------------------------------------------------------------------

  //method go to first ----------------------------------------------------------------------
  void secondexercice() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AbdosExercice2()),
    );
  }
  //-----------------------------------------------------------------------------------------

  //method build-----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          //---
          const SizedBox(height: 5),

          //exercice 1
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Mountain Climber'),
            subtitle: const Text('Exercice 1'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: firstexercice,
          ),
          //----------

          //---
          const SizedBox(height: 5),

          //exercice 2
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Russian Twist'),
            subtitle: const Text('Exercice 2'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Return the exercise name and image asset path
              Navigator.pop(context, {
                'name': 'Mountain Climber',
                'image': 'assets/mountain_climber.jpeg'
              });
            },
          ),
          //----------

          //---
          const SizedBox(height: 5),

          //exercice 3
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Mountain Climber'),
            subtitle: const Text('Exercice 3'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: firstexercice,
          ),
          //----------

          //---
          const SizedBox(height: 5),

          //exercice 4
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Mountain Climber'),
            subtitle: const Text('Exercice 4'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: firstexercice,
          ),
          //----------

          //---
          const SizedBox(height: 5),

          //exercice 5
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Mountain Climber'),
            subtitle: const Text('Exercice 5'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: firstexercice,
          ),
          //----------

          //---
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}


/*return SizedBox(
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
    );*/