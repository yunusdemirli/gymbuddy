import 'package:flutter/material.dart';
import 'package:gymbuddy_github/pages/more.dart';
import 'package:gymbuddy_github/pages/stats.dart';
import 'package:gymbuddy_github/pages/workout.dart';

import 'package:gymbuddy_github/_data/DataBase.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  ---------------- SELECTED PAGE MANAGER ----------------
  late int _currentindex;
  late DataBase db;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    db = DataBase();
    _currentindex = 1;
    _pages = [
      const Stats(),
      Workout(db: db),
      const More(),
    ];
  }

  void _ontapitem(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  //  ---------------- BUILD METHOD ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  --- APPBAR ---
      appBar: AppBar(
        title: const Center(
            child: Text(
          'GYMBUDDY',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('data'),
                  action: SnackBarAction(
                    label: 'undo',
                    onPressed: () {},
                  ),
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
      /*
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        iconSize: 30,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(fontSize: 18),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard), label: 'Stats'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), label: 'Workout'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), label: 'More'
          ),
        ]
      ),
      */

      bottomNavigationBar: BottomNavigationBar(
        onTap: _ontapitem,
        currentIndex: _currentindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'More',
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
