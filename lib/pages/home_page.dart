import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iiitdmj/components/bottom_bar.dart';
import 'package:iiitdmj/components/day_picker.dart';
import 'package:iiitdmj/components/mess_menu.dart';
import 'package:iiitdmj/components/routine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime timeBackPressed = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async{
        final diff = DateTime.now().difference(timeBackPressed);
        final isExiting = diff<=const Duration(seconds: 2);
        timeBackPressed = DateTime.now();

        if (isExiting) {
          Navigator.pop(context);
        }else {
          return;
        }
      },
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 40),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.0),
          child: SizedBox(
            child: Column(
              children: [
                Center(
                  child: DayPicker()
                ),
                Gap(3),
                Center(child: RoutineBar()),
                Gap(20),
                Center(child: Mess(),)
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomBar(pageNo: 0)
      ),
    );
  }
}