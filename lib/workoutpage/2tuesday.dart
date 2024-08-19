import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_widgets/week_days_title.dart';

class TuesdayTraining extends StatefulWidget {
  const TuesdayTraining({super.key});

  @override
  State<TuesdayTraining> createState() => _TuesdayTrainingState();
}

class _TuesdayTrainingState extends State<TuesdayTraining> {
  final TextEditingController _trainingTitle2 = TextEditingController();
  final String _title2 = '';
  final String _dataBaseTitle2 = 'title2';
  final String _weekDayTraining2 = 'Tuesday';

  @override
  Widget build(BuildContext context) {
    return WeekDaysTitle(trainingTitle: _trainingTitle2, title: _title2, dataBaseTitle: _dataBaseTitle2, weekDayTraining: _weekDayTraining2);
  }
}