import 'package:flutter/material.dart';

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
      height: 50,
      width: double.maxFinite,
      decoration: const BoxDecoration(
      color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: Text(
          weekdays[DateTime.now().weekday], 
          style: const TextStyle(
            fontSize: 27, 
            fontWeight: 
            FontWeight.bold
          ),
        )
      ),
    );
  }
}