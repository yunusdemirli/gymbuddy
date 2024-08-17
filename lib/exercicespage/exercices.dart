import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Stats extends StatefulWidget {
  const Stats({super.key});

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  final controller = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const SizedBox(height: 15,),

        CarouselSlider(
          options: CarouselOptions(
            height: 175,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          items: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color with opacity
                  spreadRadius: 5, // Spread radius
                  blurRadius: 10, // Blur radius
                  offset: const Offset(0, 1), // Offset in x and y (horizontal, vertical)
                ),
              ],
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color with opacity
                  spreadRadius: 5, // Spread radius
                  blurRadius: 10, // Blur radius
                  offset: const Offset(0, 1), // Offset in x and y (horizontal, vertical)
                ),
              ],
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3), // Shadow color with opacity
                  spreadRadius: 5, // Spread radius
                  blurRadius: 10, // Blur radius
                  offset: const Offset(0, 1), // Offset in x and y (horizontal, vertical)
                ),
              ],
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),

        const SizedBox(height: 15,),

        Center(
          child: buildIndicator()
        ),

        const SizedBox(height: 15,),

        const Divider(
          height: 1,
        ),

        const SizedBox(height: 15,),

        const Text('  My exercices', style: TextStyle(color: Colors.indigo, fontSize: 23, fontWeight: FontWeight.bold),),
        
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              ListTile(
                leading: Icon(Icons.abc, size: 50,),
                title: Text('data', style: TextStyle(fontSize: 18),),
                trailing: Icon(Icons.arrow_forward),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              ListTile(
                leading: Icon(Icons.abc, size: 50,),
                title: Text('data', style: TextStyle(fontSize: 18),),
                trailing: Icon(Icons.arrow_forward),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              ListTile(
                leading: Icon(Icons.abc, size: 50,),
                title: Text('data', style: TextStyle(fontSize: 18),),
                trailing: Icon(Icons.arrow_forward),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: 3,
    effect: const JumpingDotEffect(
      activeDotColor: Colors.indigo,
      dotHeight: 15,
      dotWidth: 15,
    ),
  );
}