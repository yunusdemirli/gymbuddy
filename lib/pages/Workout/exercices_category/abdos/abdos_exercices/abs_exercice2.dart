import 'package:flutter/material.dart';

class AbdosExercice2 extends StatelessWidget {
  const AbdosExercice2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //customine theme----------------------------------------------------------------------
      backgroundColor: Theme.of(context).colorScheme.background,

      //app bar------------------------------------------------------------------------------
      appBar: AppBar(

        //theme management
        foregroundColor: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade800,
        //----------------

        //appbar content
        title: const Center(child: Text('EXERCICE 2', style: TextStyle(fontWeight: FontWeight.bold),),),
        actions: [
          IconButton(
            onPressed: () {
              final snackBar = SnackBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                content: const Text('Welcome to GymBuddy !\n  For more information visit or social network :\n  Instagram : GymBuddy_Team\n  Facebook : GymBuddy_on_FB\n  For any question, contact us : gymbuddy_project@gmail.com'),
                action: SnackBarAction(label: 'Undo', textColor: Theme.of(context).colorScheme.background, onPressed: () {},),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: const Icon(Icons.info_outlined)
          )
        ],
      ),
      //----------------------------------------------------------------------------------

      //body of the first exercice--------------------------------------------------------
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            //---
            const SizedBox(height: 20),
        
            //exercices title
            ListTile(
              textColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text('Russian Twist', style: TextStyle(fontSize: 20),),
              trailing: SizedBox(
                width: 80,
                height: 100,
                child: ElevatedButton(onPressed: () {}, child: const Icon(Icons.add, size: 30,))
                ),
            ),
        
            //---
            const SizedBox(height: 20),
        
            //exercice picture--------------------------------------------------------------
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Image.asset('assets/russian_twist.png'),
            ),
            //------------------------------------------------------------------------------
        
            //---
            const SizedBox(height: 50),
        
            //exercice description 1--------------------------------------------------------
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Step 1 : Starting position', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold),),
                        
                    Text('Begin in a plank position. Place your hands directly under your shoulders, with your arms fully extended.', style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
                  ],
                ),
              )
            ),
            //------------------------------------------------------------------------------

            //---
            const SizedBox(height: 50),

            //exercice description 2--------------------------------------------------------
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Step 2 : Movement', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold),),
                    Text('1) Lift your right foot off the floor and drive your right knee towards your chest as far as you can.', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                    const Text(''),
                    Text('2) Quickly switch legs, bringing your right foot back to the starting position and simultaneously bringing your left knee towards your chest.', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                    const Text(''),
                    Text('3) Continue to alternate legs in a smooth, controlled manner. It should feel like you are “running” in place while maintaining the plank position.', style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
                  ],
                ),
              )
            ),
            //------------------------------------------------------------------------------
        
            //---
            const SizedBox(height: 50),
        
            //exercice description 2--------------------------------------------------------
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Step 3 : Breathing', style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold),),
                        
                    Text('Maintain a steady breathing pattern. Inhale and exhale naturally, trying not to hold your breath.', style: TextStyle(color: Theme.of(context).colorScheme.secondary),)
                  ],
                ),
              )
            ),
            //------------------------------------------------------------------------------

            //---
            const SizedBox(height: 50),
          ]
        ),
      )
      //----------------------------------------------------------------------------------
    );
  }
}