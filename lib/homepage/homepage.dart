import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int index = 1;

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

      //  --- BOTTOMNAVIGATIONBAR
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

      //  --- BODY ---
      body: const Column(
        children: [
          Text('data'),
          Text('data'),
        ],
      ),
    );
  }
}