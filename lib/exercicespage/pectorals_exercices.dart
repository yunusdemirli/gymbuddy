import 'package:flutter/material.dart';

//  --- EXPLANATION ---
//  this class manages the list of exercices for pectorals category.
//  -------------------
class Pectoralsexercices extends StatelessWidget {
  const Pectoralsexercices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.abc),
          title: const Center(child: Text('Barbell Bench Press')),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.abc),
          title: const Center(child: Text('Dumbbell Flyes')),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.abc),
          title: const Center(child: Text('Cable Crossovers')),
          trailing: const Icon(Icons.arrow_forward_ios_rounded),
          onTap: () {},
        ),
      ],
    );
  }
}