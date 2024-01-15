import 'package:flutter/material.dart';
import 'package:iiitdmj/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class DayPicker extends StatefulWidget {
  const DayPicker({super.key});

  @override
  State<DayPicker> createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  List<String> weekdays = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Color(0xff8AAAE5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0xff8AAAE5),
            spreadRadius: 4,
            blurRadius: 10,
          ),
          BoxShadow(
            color: Color(0xff8AAAE5),
            spreadRadius: -4,
            blurRadius: 5,
          )
        ]
      ),
      child: Center(
        child: Text(
          weekdays[DateTime.now().weekday], 
          style: TextStyle(
            color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary,
            fontSize: 27, 
            fontWeight: 
            FontWeight.bold
          ),
        )
      ),
    );
  }
}