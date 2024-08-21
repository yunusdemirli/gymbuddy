import 'package:flutter/material.dart';
import 'package:gymbuddy_github/exerciceslist/pectorals_exercices_list/1bardell_bench_press.dart';

//  --- EXPLANATION ---
//  this class manages the list of exercices for pectorals category.
//  -------------------
class PectoralsexercicesList extends StatelessWidget {
  const PectoralsexercicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Text('1', style: TextStyle(fontSize: 20),),
          title: const Text('Barbell Bench Press'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BardellBenchPress()));
          },
        ),
        ListTile(
          leading: const Text('2', style: TextStyle(fontSize: 20),),
          title: const Text('Dumbbell Flyes'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
        ListTile(
          leading: const Text('3', style: TextStyle(fontSize: 20),),
          title: const Text('Cable Crossovers'),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
      ],
    );
  }
}