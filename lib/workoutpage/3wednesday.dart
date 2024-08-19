import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_widgets/week_days_title.dart';

class WednesdayTraining extends StatefulWidget {
  const WednesdayTraining({super.key});

  @override
  State<WednesdayTraining> createState() => _WednesdayTrainingState();
}

class _WednesdayTrainingState extends State<WednesdayTraining> {
  final TextEditingController _trainingTitle3 = TextEditingController();
  final String _title3 = '';
  final String _dataBaseTitle3 = 'title3';
  final String _weekDayTraining3 = 'Wednesday';

  @override
  Widget build(BuildContext context) {
    return WeekDaysTitle(trainingTitle: _trainingTitle3, title: _title3, dataBaseTitle: _dataBaseTitle3, weekDayTraining: _weekDayTraining3);
  }
}