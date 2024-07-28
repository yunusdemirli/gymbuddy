//import required packages---------------------------------------------------------------
import 'dart:developer';

import 'package:hive/hive.dart';
//---------------------------------------------------------------------------------------

//DATABASE CLASS-------------------------------------------------------------------------
class DataBase {
  //import required variables------------------------------------------------------------
  final mybox = Hive.box('mybox');

  //-------------------------------------------------------------------------------------

  Map<String, List<Map<String, String>>> WorkoutList = {};

  //create first data--------------------------------------------------------------------
  void CreateInitData() {
    WorkoutList = {
      'MONDAY': [
        {'Exercice': 'montain climber', 'Image': 'assets/mountain_climber.jpeg'}
      ],
      'TUESDAY': [
        {'Exercice': 'montain climber', 'Image': 'assets/mountain_climber.jpeg'}
      ],
      'WEDNESDAY': [
        {'Exercice': 'montain climber', 'Image': 'assets/mountain_climber.jpeg'}
      ],
      'THURSDAY': [
        {'Exercice': 'montain climber', 'Image': 'assets/mountain_climber.jpeg'}
      ],
      'FRIDAY': [
        {'Exercice': 'montain climber', 'Image': 'assets/mountain_climber.jpeg'}
      ],
      'SATURDAY': [
        {'Exercice': 'montain climber', 'Image': 'assets/mountain_climber.jpeg'}
      ],
      'SUNDAY': [
        {'Exercice': 'montain climber', 'Image': 'assets/mountain_climber.jpeg'}
      ],
    };
  }
  //--------------------------------------------------------------------------------------

  //load data-----------------------------------------------------------------------------
  void LoadData() {
    dynamic data = mybox.get("WORKOUTLIST");

    if (data == null || data is! Map) {
      WorkoutList = {};
      return;
    }

    WorkoutList = data.map<String, List<Map<String, String>>>((key, value) {
      if (value is! List) {
        throw Exception("Invalid data format in Hive box: $key");
      }

      return MapEntry(
        key,
        value.map<Map<String, String>>((item) {
          if (item is! Map) {
            throw Exception("Invalid data format in Hive box: $key");
          }

          return Map<String, String>.from(item.cast<String, String>());
        }).toList(),
      );
    });
  }
  //--------------------------------------------------------------------------------------

  //update data---------------------------------------------------------------------------
  void UpdateData() {
    mybox.put("WORKOUTLIST", WorkoutList);
  }
  //--------------------------------------------------------------------------------------

  List<Map<String, dynamic>> valeursList = [];

  void createInitData1() {
    valeursList = [];
  }
  //--------------------------------------------------------------------------------------

  //load data-----------------------------------------------------------------------------
  void LoadData1(String day, String exercise) {
    log('Loading data');
    dynamic data = mybox.get("LIST$day$exercise");
    if (data != null && data is List) {
      valeursList = List<Map<String, dynamic>>.from(data
          .map((item) => (item is Map)
              ? Map<String, dynamic>.from(item.cast<String, dynamic>())
              : null)
          .where((item) => item != null));
    } else {
      valeursList = [];
    }
  }

  void UpdateData1(String day, String exercise) {
    mybox.put("LIST$day$exercise", valeursList);
  }

  void printBoxContents(Box box) {
    List<dynamic> keys = box.keys.toList();
    for (var key in keys) {
      var value = box.get(key);
      print('$key: $value');
    }
  }
}
