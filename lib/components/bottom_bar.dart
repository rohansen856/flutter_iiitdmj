import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:iiitdmj/pages/find_page.dart';
import 'package:iiitdmj/pages/home_page.dart';
import 'package:iiitdmj/pages/settings_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.pageNo});
  final int pageNo;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var box = Hive.box('testBox');
  void func(){
    box.put(1, 'value');
    print(box.get(1));
  }

  final pages = [HomePage(), FindPage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.pageNo,
      selectedItemColor: Colors.black,
      items: const [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.newspaper)),
        BottomNavigationBarItem(label: "Find", icon: Icon(Icons.search)),
        BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
      ],
      onTap: (index){
          func();
          Navigator.push(context, MaterialPageRoute(builder: (context)=> pages[index]));
      },
    );
  }
}