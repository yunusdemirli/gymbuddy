import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddy_github/main.dart';
import 'package:gymbuddy_github/workoutpage/list_of_workout.dart';
import 'package:shared_preferences/shared_preferences.dart';

//  --- EXPLANATION ---
//  this class manages the massive carousel slider at the center of the workout page.
//  -------------------
class MyCarouselslider extends StatefulWidget {

  final CarouselSliderController mycarouselSliderController;
  const MyCarouselslider({super.key, required this.mycarouselSliderController});

  @override
  State<MyCarouselslider> createState() => _MyCarouselsliderState();
}

class _MyCarouselsliderState extends State<MyCarouselslider> with RouteAware {

  //  string used to name the days's training titles
  String _mondayTitle = '';
  String _tuesdayTitle = '';
  String _wednesdayTitle = '';
  String _thursdayTitle = '';
  String _fridayTitle = '';
  String _saturdayTitle = '';
  String _sundayTitle = '';

  //  initState from sharedpreferences method
  @override
  void initState() {
    super.initState();
    _loadTrainingTitle();
  }

  //  load training name's data from the database using sharedpreferences
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

  //  --- route observer method the update the page after modifications of the training
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }
  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
  @override
  void didPopNext() {
    // This method is called when the page comes back into view after popping.
    _loadTrainingTitle(); // refresh the data
  }
  //  --- end of the route observer method  ---

  //  build method
  @override
  Widget build(BuildContext context) {

    //  list of column widget, each column for a container of the carousel slider
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

    //  to get the date time
    DateTime now = DateTime.now();
    int weekday = now.weekday;

    //  list of string to name the containers day
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
      carouselController: widget.mycarouselSliderController,
    );
  }
  //  --- end of the build method ---
}