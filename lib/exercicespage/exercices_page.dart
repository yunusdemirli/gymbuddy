import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_widgets/exercice_category_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
        
          const SizedBox(height: 15,),
        
          Row(
            children: [
              const Text('  Exercices', style: TextStyle(color: Colors.indigo, fontSize: 23, fontWeight: FontWeight.bold),),

              const Spacer(),

              TextButton(onPressed: () {const ExerciceCategoryList();}, child: const Text('see all'),),

              const SizedBox(width: 5,),
            ],
          ),
          
          const SizedBox(height: 15,),
        
          const ExerciceCategoryList(),

        ],
      ),
    );
  }

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


//  Custom workouts containers class
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