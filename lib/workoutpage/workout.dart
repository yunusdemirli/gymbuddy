import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/morepage/more.dart';
import 'package:gymbuddy_github/workoutpage/list_of_workout.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {

  final CarouselController _carouselController = CarouselController();

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

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20,),

          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  onPressed: () {
                    _carouselController.previousPage(
                      curve: Curves.easeIn,
                    );
                  },
                  style: ElevatedButton.styleFrom(side: BorderSide.none,),
                  icon: const Icon(Icons.arrow_back)
                ),

                const SizedBox(width: 50,),

                const Text('My Training Plan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),),
                
                const SizedBox(width: 50,),

                IconButton(
                  onPressed: () {
                    _carouselController.nextPage(
                      curve: Curves.easeIn,
                    );
                  },
                  style: ElevatedButton.styleFrom(side: BorderSide.none),
                  icon: const Icon(Icons.arrow_forward)
                ),
              
              ],
            ),
          ),

          const SizedBox(height: 75,),

          
          CarouselSlider(
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
                  alignment: Alignment.center,
                  child: Text(day, style: const TextStyle(color: Colors.white, fontSize: 25))),
              );
              
            }).toList(),
            options: CarouselOptions(
              height: 350,
              enlargeCenterPage: true,
              initialPage: weekday,
            ),
            carouselController: _carouselController,
          ),
          
          const SizedBox(height: 50,),

          ElevatedButton(onPressed: () {}, child: const Text('Add a training session', style: TextStyle(color: Colors.indigo),))
        ],
      ),
    );
  }
}