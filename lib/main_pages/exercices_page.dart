import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_exercices_list_widgets/custom_workouts_slider.dart';
import 'package:gymbuddy_github/_exercices_list_widgets/exercice_category_list.dart';
import 'package:gymbuddy_github/_exercices_list_widgets/choose_your_exercice.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//  --- EXPLANATION ---
//  this class manages the exercices page, the first page of the bottomnavigationbar.
//  -------------------
class ExercicesPage extends StatefulWidget {
  const ExercicesPage({super.key});

  @override
  State<ExercicesPage> createState() => _ExercicesPageState();
}

class _ExercicesPageState extends State<ExercicesPage> {

  final List<Color> mycolors = [
    Colors.blue,
    Colors.black,
    Colors.purple,
  ];

  final controller = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //  upper part of the exercices pages
          const SizedBox(height: 15,),

          const Text('  Custom Workouts', style: TextStyle(color: Colors.indigo, fontSize: 23, fontWeight: FontWeight.bold),),
        
          CarouselSlider(
            options: CarouselOptions(
              height: 175,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            items: [
              CarouselContainer(mycolor: mycolors[0],),
              CarouselContainer(mycolor: mycolors[1],),
              CarouselContainer(mycolor: mycolors[2],),
            ],
          ),
        
          const SizedBox(height: 15,),
        
          Center(
            child: buildIndicator()
          ),
        
          const SizedBox(height: 15,),
        
          const Divider(
            color: Colors.indigo,
          ),

          //  bottom part of the exercices pages
          const SizedBox(height: 15,),
        
          Row(
            children: [
              const Text('  Exercices', style: TextStyle(color: Colors.indigo, fontSize: 23, fontWeight: FontWeight.bold),),

              const Spacer(),

              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ChooseYourExercicePage() ));
                },
                child: const Text('see all'),
              ),

              const SizedBox(width: 5,),
            ],
          ),
          
          const SizedBox(height: 15,),
        
          const ExerciceCategoryList(),

        ],
      ),
    );
  }

  //  manages the indicator under the exercice page's carousel slider
  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: mycolors.length,
    effect: const JumpingDotEffect(
      activeDotColor: Colors.indigo,
      dotHeight: 15,
      dotWidth: 15,
    ),
  );
}

