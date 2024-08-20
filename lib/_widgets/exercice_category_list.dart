import 'package:flutter/material.dart';
import 'package:gymbuddy_github/exercicespage/pectorals_exercices.dart';

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
          ExpansionTileExercices(expansionTileName: 'Pectorals', onTapWidget: Pectoralsexercices(), icon: Icon(Icons.abc, color: Colors.indigo,),),
      
          SizedBox(height: 20,),
      
          ExpansionTileExercices(expansionTileName: 'Deltoid', onTapWidget: Pectoralsexercices(), icon: Icon(Icons.abc, color: Colors.indigo,),),
      
          SizedBox(height: 20,),
      
          ExpansionTileExercices(expansionTileName: 'Dorsals', onTapWidget: Pectoralsexercices(), icon: Icon(Icons.abc, color: Colors.indigo,),),
      
          SizedBox(height: 20,),
      
          ExpansionTileExercices(expansionTileName: 'Biceps', onTapWidget: Pectoralsexercices(), icon: Icon(Icons.abc, color: Colors.indigo,),),
      
          SizedBox(height: 20,),
      
          ExpansionTileExercices(expansionTileName: 'Triceps', onTapWidget: Pectoralsexercices(), icon: Icon(Icons.abc, color: Colors.indigo,),),
      
          SizedBox(height: 20,),
      
          ExpansionTileExercices(expansionTileName: 'Legs', onTapWidget: Pectoralsexercices(), icon: Icon(Icons.abc, color: Colors.indigo,),),
      
          SizedBox(height: 20,),
          
          ExpansionTileExercices(expansionTileName: 'Abs', onTapWidget: Pectoralsexercices(), icon: Icon(Icons.abc, color: Colors.indigo,),),
      
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