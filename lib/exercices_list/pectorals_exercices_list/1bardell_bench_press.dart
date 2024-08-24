import 'package:flutter/material.dart';

class BardellBenchPress extends StatefulWidget {
  const BardellBenchPress({super.key});

  @override
  State<BardellBenchPress> createState() => _BardellBenchPressState();
}

class _BardellBenchPressState extends State<BardellBenchPress> {
  final String bardellBenchPressTitle = 'Bardell bench press';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('GYMBUDDY', style: TextStyle(fontWeight: FontWeight.bold),)),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('data'),
                  action: SnackBarAction(label: 'undo', onPressed:() {},),
                  ),
                );
              },
            icon: const Icon(Icons.info_outlined),
            )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

          const SizedBox(height: 20),

          Row(
            children: [
              const SizedBox(width: 25,),

              Text(bardellBenchPressTitle, style: const TextStyle(fontSize: 22, color: Colors.indigo),),
              
              const Spacer(),

              SizedBox(
                width: 80,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                  },
                  child: const Icon(Icons.add, size: 30),
                ),
              ),

              const SizedBox(width: 25,),
            ],
          ),

          const SizedBox(height: 50),

          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: const Center(child: Text('exercice illustration with a carousel slider', style: TextStyle(color: Colors.white),)),
          ),

          const SizedBox(height: 50),

          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.indigo,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Step 1 : Starting position', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  Text('Begin in a plank position. Place your hands directly under your shoulders, with your arms fully extended.', style: TextStyle(color: Colors.white,),),
                ],
              ),
            )
          ),

          const SizedBox(height: 50),

          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.indigo,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Step 2 : Movement\n',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  Text('1) Lift your right foot off the floor and drive your right knee towards your chest as far as you can.\n', style: TextStyle(color: Colors.white),),
                  Text('2) Quickly switch legs, bringing your right foot back to the starting position and simultaneously bringing your left knee towards your chest.\n', style: TextStyle(color: Colors.white),),
                  Text('3) Continue to alternate legs in a smooth, controlled manner. It should feel like you are “running” in place while maintaining the plank position.\n', style: TextStyle(color: Colors.white),),
                ],
              ),
            )
          ),

          const SizedBox(height: 50),

          Container(
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.indigo,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Step 3 : Breathing\n', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('Maintain a steady breathing pattern. Inhale and exhale naturally, trying not to hold your breath.\n', style: TextStyle(color: Colors.white),),
                ],
              ),
            )
          ),

          //---
          const SizedBox(height: 50),
          ],
        ),
      )
    );
  }
}