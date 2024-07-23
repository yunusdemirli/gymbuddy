import 'package:flutter/material.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20,),

          SizedBox(
            child: Row(
              children: [
                const SizedBox(width: 10,),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(side: BorderSide.none,), child: const Icon(Icons.arrow_back),),
                const SizedBox(width: 15,),
                const Text('My Training Planning', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),),
                const SizedBox(width: 15,),
                ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(side: BorderSide.none) ,child: const Icon(Icons.arrow_forward),),
              ],
            ),
          ),

          const SizedBox(height: 150,),

          Container(
            color: Colors.indigo,
            height: 200,
            width: 200,
            child: const Center(child: Text('calendar', style: TextStyle(color: Colors.white),)),
          ),

          const SizedBox(height: 150,),

          ElevatedButton(onPressed: () {}, child: const Text('Add a training session', style: TextStyle(color: Colors.indigo),))
        ],
      ),
    );
  }
}