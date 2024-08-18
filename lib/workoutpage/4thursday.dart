import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_widgets/week_days_title.dart';

class ThursdayTraining extends StatefulWidget {
  const ThursdayTraining({super.key});

  @override
  State<ThursdayTraining> createState() => _ThursdayTrainingState();
}

class _ThursdayTrainingState extends State<ThursdayTraining> {
  final TextEditingController _trainingTitle4 = TextEditingController();
  final String _title4 = '';
  final String _dataBaseTitle4 = 'title4';
  final String _weekDayTraining4 = 'Thursday';

  @override
  Widget build(BuildContext context) {
    return WeekDaysBody(trainingTitle: _trainingTitle4, title: _title4, dataBaseTitle: _dataBaseTitle4, weekDayTraining: _weekDayTraining4);
  }
}