import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_days_widgets/week_days_title.dart';

class FridayTraining extends StatefulWidget {
  const FridayTraining({super.key});

  @override
  State<FridayTraining> createState() => _FridayTrainingState();
}

class _FridayTrainingState extends State<FridayTraining> {
  final TextEditingController _trainingTitle5 = TextEditingController();
  final String _title5 = '';
  final String _dataBaseTitle5 = 'title5';
  final String _weekDayTraining5 = 'Friday';

  @override
  Widget build(BuildContext context) {
    return WeekDaysTitle(trainingTitle: _trainingTitle5, title: _title5, dataBaseTitle: _dataBaseTitle5, weekDayTraining: _weekDayTraining5);
  }
}