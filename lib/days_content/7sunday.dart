import 'package:flutter/material.dart';
import 'package:gymbuddy_github/_days_widgets/week_days_title.dart';

class SundayTraining extends StatefulWidget {
  const SundayTraining({super.key});

  @override
  State<SundayTraining> createState() => _SundayTrainingState();
}

class _SundayTrainingState extends State<SundayTraining> {
  final TextEditingController _trainingTitle7 = TextEditingController();
  final String _title7 = '';
  final String _dataBaseTitle7 = 'title7';
  final String _weekDayTraining7 = 'Sunday';

  @override
  Widget build(BuildContext context) {
    return WeekDaysTitle(trainingTitle: _trainingTitle7, title: _title7, dataBaseTitle: _dataBaseTitle7, weekDayTraining: _weekDayTraining7);
  }
}