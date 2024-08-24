import 'package:flutter/material.dart';

//  --- EXPLANATION ---
//  this class manages the containers of the carousel slider in the upper part
//  of this page.
//  -------------------
class CarouselContainer extends StatelessWidget {
  final Color mycolor;
  const CarouselContainer({super.key, required this.mycolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(0, 1),
        ),
      ],
        color: mycolor,
        borderRadius: BorderRadius.circular(20)
      ),
    );
  }
}