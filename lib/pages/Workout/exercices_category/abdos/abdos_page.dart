//required packages--------------------------------------------------------------------------
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_data/DataBase.dart';
import 'package:gymbuddy_github/pages/Workout/exercices_category/abdos/abdos_exercices/abs_exercice2.dart';
//-------------------------------------------------------------------------------------------

//ABDOS CLASS--------------------------------------------------------------------------------
class Abdos extends StatefulWidget {
  final String name;
  final DataBase db;
  final List<Map<String, String>> exercises;

  const Abdos(
      {super.key,
      required this.name,
      required this.db,
      required this.exercises});

  @override
  State<Abdos> createState() => _AbdosState();
}

class _AbdosState extends State<Abdos> {
  //method go to first ----------------------------------------------------------------------

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
  final String exo = "mountain climber";
  final String im = "assets/mountain_climber.jpg";
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> exercices = widget.exercises;

    void firstexercice() {
      Navigator.pop(context, {});
    }

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
            trailing: const Icon(Icons.add),
            onTap: () async {
              Navigator.pop(context, {
                setState(() {
                  exercices.add({"Exercice": exo, "Image": im});
                }),
                widget.db.UpdateData(),
              });
            },
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