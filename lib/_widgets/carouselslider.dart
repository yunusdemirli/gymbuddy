import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/workoutpage/workout_of_the_day.dart';

class MyCarouselslider extends StatelessWidget {

  final CarouselController mycarouselController;
  final int _isDayOff = 0;
  const MyCarouselslider({super.key, required this.mycarouselController});

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    int weekday = now.weekday;
    final List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday"
    ];

    return CarouselSlider(

      items: days.map((day) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfWorkout(selectedDay: day,)));
          },
          child: Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(day, style: const TextStyle(color: Colors.white, fontSize: 25,),),
                const Divider(height: 10, color: Colors.white,),
                _isDayOff == 0 ? const Column(
                  children: [
                    SizedBox(height: 100,),
                    Center(child: Text("Day off", style: TextStyle(color: Colors.white, fontSize: 20),))
                  ],
                ) : const SizedBox.shrink(),
              ],
            )
          ),
        );
              
      }).toList(),
      options: CarouselOptions(
        height: 350,
        enlargeCenterPage: true,
        initialPage: weekday,
      ),
      carouselController: mycarouselController,
    );
  }
}