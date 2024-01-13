import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iiit/components/bottom_bar.dart';
import 'package:iiit/components/mess.dart';
import 'package:iiit/components/routine.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var box = Hive.box('testBox');
  void func(){
    box.put(1, 'value');
    print(box.get(1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.0),
        child: SizedBox(
          child: Column(
            children: [
              Center(child: RoutineBar()),
              SizedBox(height: 20),
              Center(child: Mess(),)
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(pageNo: 0)
    );
  }
}