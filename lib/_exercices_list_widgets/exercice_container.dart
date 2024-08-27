import 'package:flutter/material.dart';

class ExerciceContainer extends StatelessWidget {
  final String containerName;
  const ExerciceContainer({
    super.key,
    required this.containerName,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(2, 4),
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.indigo[200],
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: 350,
      child: Row(
        children: [
          Checkbox(value: false, onChanged: (value) {} ),
          Text(containerName, style: const TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
}