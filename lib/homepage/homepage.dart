import 'package:flutter/material.dart';
import 'package:gymbuddy_github/morepage/more.dart';
import 'package:gymbuddy_github/exercicespage/exercices.dart';
import 'package:gymbuddy_github/workoutpage/workout.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //  ---------------- SELECTED PAGE MANAGER ----------------
  int _currentindex = 1;

  void _ontapitem(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  final List<Widget> _pages = [
    const Stats(),
    const Workout(),
    const More(),
  ];

  //  ---------------- BUILD METHOD ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  --- APPBAR ---
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

      //  --- DRAWER ---
      drawer: const Drawer(
        child: Column(
          children: [
            Text('data'),
            Text('data'),
          ],
        ),
      ),

      //  --- BOTTOMNAVIGATIONBAR ---
      bottomNavigationBar: BottomNavigationBar(
        
        onTap: _ontapitem,
        currentIndex: _currentindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), label: 'Exercices',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_calendar), label: 'Workout',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), label: 'More',
            ),
        ],
        iconSize: 40,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.blue,
        showUnselectedLabels: false,
      ),      

      //  --- BODY ---
      body: _pages[_currentindex],
    );
  }
}