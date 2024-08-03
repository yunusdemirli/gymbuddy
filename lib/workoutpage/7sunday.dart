import 'package:flutter/material.dart';

class SundayTraining extends StatelessWidget {
  const SundayTraining({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),

        Text('  Sunday Training', style: TextStyle(fontSize: 20, color: Colors.indigo),),

        Divider(
          color: Colors.indigo,
          thickness: 1,
        )
      ],
    );
  }
}