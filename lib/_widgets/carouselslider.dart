import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/workoutpage/listofworkout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCarouselslider extends StatefulWidget {

  final CarouselController mycarouselController;
  const MyCarouselslider({super.key, required this.mycarouselController});

  @override
  State<MyCarouselslider> createState() => _MyCarouselsliderState();
}

class _MyCarouselsliderState extends State<MyCarouselslider> {

  String _mondayTitle = '';
  String _tuesdayTitle = '';
  String _wednesdayTitle = '';
  String _thursdayTitle = '';
  String _fridayTitle = '';
  String _saturdayTitle = '';
  String _sundayTitle = '';

  @override
  void initState() {
    super.initState();
    _loadTrainingTitle();
  }

  void _loadTrainingTitle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _mondayTitle = prefs.getString('title1') ?? 'No data found';
      _tuesdayTitle = prefs.getString('title2') ?? 'No data found';
      _wednesdayTitle = prefs.getString('title3') ?? 'No data found';
      _thursdayTitle = prefs.getString('title4') ?? 'No data found';
      _fridayTitle = prefs.getString('title5') ?? 'No data found';
      _saturdayTitle = prefs.getString('title6') ?? 'No data found';
      _sundayTitle = prefs.getString('title7') ?? 'No data found';
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> weekdayscontainer = [
      Column(
        children: [
          Center(child: Text(_mondayTitle, style: const TextStyle(color: Colors.white, fontSize: 20,),))
        ],
      ),
      Column(
        children: [
          Center(child: Text(_tuesdayTitle, style: const TextStyle(color: Colors.white, fontSize: 20,),))
        ],
      ),
      Column(
        children: [
          Center(child: Text(_wednesdayTitle, style: const TextStyle(color: Colors.white, fontSize: 20,),))
        ],
      ),
      Column(
        children: [
          Center(child: Text(_thursdayTitle, style: const TextStyle(color: Colors.white, fontSize: 20,),))
        ],
      ),
      Column(
        children: [
          Center(child: Text(_fridayTitle, style: const TextStyle(color: Colors.white, fontSize: 20,),))
        ],
      ),
      Column(
        children: [
          Center(child: Text(_saturdayTitle, style: const TextStyle(color: Colors.white, fontSize: 20,),))
        ],
      ),
      Column(
        children: [
          Center(child: Text(_sundayTitle, style: const TextStyle(color: Colors.white, fontSize: 20,),))
        ],
      ),
    ];

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
      
      items: List.generate(days.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListOfWorkout(selectedDay: days[index],)));
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
                Text(days[index], style: const TextStyle(color: Colors.white, fontSize: 25,),),
                const Divider(height: 10, color: Colors.white,),
                const SizedBox(height: 25,),
                weekdayscontainer[index],
              ],
            )
          ),
        );
              
      }).toList(),
      options: CarouselOptions(
        height: 350,
        enlargeCenterPage: true,
        initialPage: weekday - 1,
      ),
      carouselController: widget.mycarouselController,
    );
  }
}