import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_widgets/week_days_title.dart';

class SaturdayTraining extends StatefulWidget {
  const SaturdayTraining({super.key});

  @override
  State<SaturdayTraining> createState() => _SaturdayTrainingState();
}

class _SaturdayTrainingState extends State<SaturdayTraining> {
  final TextEditingController _trainingTitle6 = TextEditingController();
  final String _title6 = '';
  final String _dataBaseTitle6 = 'title6';
  final String _weekDayTraining6 = 'Saturday';

  @override
  Widget build(BuildContext context) {
    return WeekDaysBody(trainingTitle: _trainingTitle6, title: _title6, dataBaseTitle: _dataBaseTitle6, weekDayTraining: _weekDayTraining6);
  }
}