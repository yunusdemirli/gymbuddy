import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

int Myindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: const Center(child: Text("GYMBUDDY", style: TextStyle(fontWeight: FontWeight.bold),)),
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            Text('data1'),
            Text('data2'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            Myindex = index;
          });
        },
        currentIndex: Myindex,
        iconSize: 30,
        selectedLabelStyle: const TextStyle(fontSize: 15),
        unselectedLabelStyle: const TextStyle(fontSize: 15),
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: "Stats",
            backgroundColor: Colors.white,
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "Workout",
            ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "More",
            ),
        ]
        ),

      body: const Center(
        child: Column(
          children: [
            Text('data')
          ],
        ),
      ),
    );
  }
}