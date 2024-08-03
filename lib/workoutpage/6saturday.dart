import 'package:flutter/material.dart';

class SaturdayTraining extends StatelessWidget {
  const SaturdayTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),

        Text('  Saturday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        Divider(
          color: Colors.indigo,
          thickness: 1,
        )
      ],
    );
  }
}