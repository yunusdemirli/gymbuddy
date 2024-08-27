import 'package:flutter/material.dart';
import 'package:gymbuddy_github/exercices_list/pectorals_exercices_list/pectorals_exercices_list.dart';

//  --- EXPLANATION ---
//  this class manages the exercices list column at the end of the exercices pages of the app,
//  under the Custom Workouts carousel slider.
//  -------------------
class ExerciceCategoryList extends StatelessWidget {
  const ExerciceCategoryList({super.key,});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [

          //  pectorals exercices
          ExpansionTileExercices(expansionTileName: 'Pectorals', onTapWidget: PectoralsexercicesList(), icon: Icon(Icons.abc, color: Colors.indigo,),),
          SizedBox(height: 20,),

          //  deltoid exercices
          ExpansionTileExercices(expansionTileName: 'Deltoid', onTapWidget: PectoralsexercicesList(), icon: Icon(Icons.abc, color: Colors.indigo,),),
          SizedBox(height: 20,),

          //  dorsals exercices
          ExpansionTileExercices(expansionTileName: 'Dorsals', onTapWidget: PectoralsexercicesList(), icon: Icon(Icons.abc, color: Colors.indigo,),),
          SizedBox(height: 20,),

          //  biceps exercices
          ExpansionTileExercices(expansionTileName: 'Biceps', onTapWidget: PectoralsexercicesList(), icon: Icon(Icons.abc, color: Colors.indigo,),),
          SizedBox(height: 20,),

          //  triceps exercices
          ExpansionTileExercices(expansionTileName: 'Triceps', onTapWidget: PectoralsexercicesList(), icon: Icon(Icons.abc, color: Colors.indigo,),),
          SizedBox(height: 20,),

          //  legs exercices
          ExpansionTileExercices(expansionTileName: 'Legs', onTapWidget: PectoralsexercicesList(), icon: Icon(Icons.abc, color: Colors.indigo,),),
          SizedBox(height: 20,),

          //  abs exercices
          ExpansionTileExercices(expansionTileName: 'Abs', onTapWidget: PectoralsexercicesList(), icon: Icon(Icons.abc, color: Colors.indigo,),),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

//  --- EXPLANATION ---
//  this class manages the extansiontile widget for each body muscle category of the
//  exercices list.
//  -------------------
class ExpansionTileExercices extends StatelessWidget {
  final String expansionTileName;
  final Widget onTapWidget;
  final Icon icon;
  const ExpansionTileExercices({super.key, required this.expansionTileName, required this.onTapWidget, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      backgroundColor: Colors.grey[400],
      textColor: Colors.indigo,
      title: Center(child: Text(expansionTileName, style: const TextStyle(color: Colors.indigo, fontSize: 20),)),
      leading: icon,
      children: [
        onTapWidget,
      ],
    );
  }
}