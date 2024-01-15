import 'package:flutter/material.dart';
import 'package:iiitdmj/components/bottom_bar.dart';
import 'package:iiitdmj/components/course_credit.dart';
import 'package:iiitdmj/components/http_component.dart';
import 'package:iiitdmj/components/search_bar.dart';

class FindPage extends StatefulWidget {
  const FindPage({super.key});

  @override
  State<FindPage> createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 7.0),
        // child: SearchBarComponent()
        // child: HttpCheck(),
        child: ChartComponent(),
      ),
      bottomNavigationBar: const BottomBar(pageNo: 1)
    );
  }
}