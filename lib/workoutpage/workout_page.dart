import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:gymbuddy_github/_widgets/workout_carousel_slider.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  final CarouselController carouselController = CarouselController();
  

  @override
  Widget build(BuildContext context) {

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
                    carouselController.previousPage(
                      curve: Curves.easeIn,
                    );
                  },
                  style: ElevatedButton.styleFrom(side: BorderSide.none,),
                  icon: const Icon(Icons.arrow_back)
                ),

                const SizedBox(width: 50,),

                const Text('My Workout Plan', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),),
                
                const SizedBox(width: 50,),

                IconButton(
                  onPressed: () {
                    carouselController.nextPage(
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

          MyCarouselslider(mycarouselController: carouselController,),
          
          const SizedBox(height: 35,),

          SizedBox(
            height: 60,
            width: 90,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.indigo,
              splashColor: Colors.indigoAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.play_arrow, size: 20, color: Colors.white,)
            ),
          )
        ],
      ),
    );
  }
}