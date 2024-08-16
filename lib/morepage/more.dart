import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymbuddy_github/homepage/homepage.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
          child: Container(
            height: 130,
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.purple, width: 2,),
            ),
            child: const Row(
              children: [
                SizedBox(width: 20,),
                FaIcon(FontAwesomeIcons.instagram, color: Colors.purple, size: 70,),
                SizedBox(width: 20,),
                Text('Follow us on Instagram', style: TextStyle(color: Colors.purple, fontSize: 20),)
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
          child: Container(
            height: 130,
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue, width: 2,),
            ),
            child: const Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.email_outlined, color: Colors.blue, size: 70,),
                SizedBox(width: 20,),
                Text('Send Feedback', style: TextStyle(color: Colors.blue, fontSize: 20),)
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
          child: Container(
            height: 130,
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber, width: 2,),
            ),
            child: const Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.star_border_outlined, color: Colors.amber, size: 70,),
                SizedBox(width: 20,),
                Text('Rate us', style: TextStyle(color: Colors.amber, fontSize: 20),)
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
          child: Container(
            height: 130,
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 2,),
            ),
            child: const Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.share_outlined, color: Colors.green, size: 70,),
                SizedBox(width: 20,),
                Text('Share to a friend', style: TextStyle(color: Colors.green, fontSize: 20),)
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
          child: Container(
            height: 130,
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.red, width: 2,),
            ),
            child: const Row(
              children: [
                SizedBox(width: 20,),
                Icon(Icons.info_outline, color: Colors.red, size: 70,),
                SizedBox(width: 20,),
                Text('More information', style: TextStyle(color: Colors.red, fontSize: 20),)
              ],
            ),
          ),
        ),

      ],
    );
  }
}