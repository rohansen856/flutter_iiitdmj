import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iiit/database/routine_database.dart';

class RoutineBar extends StatefulWidget {
  const RoutineBar({super.key});

  @override
  State<RoutineBar> createState() => _RoutineBarState();
}

class RoutineData {
  String? type;
  String? code; 
  String? prof;
  
  RoutineData(this.type, this.code, this.prof);
}

class _RoutineBarState extends State<RoutineBar> {
  final routine = [];
  final _mybox = Hive.box('testBox');
  
  Future<void> func() async{
    print('object');
    await RoutineDatabase().initDatabase();
    final data = _mybox.get('routine');
    setState(() {
      routine.addAll(data);
    });
  }

  @override
  void initState() {
    func();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
          height: 90.0, // Set the desired height of your list
          color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: routine.length,
            itemBuilder: ((context, index) {
              final classes = routine[index];
              return Container(
                height: 90.0,
                width: 150,
                color: Colors.amber,
                margin: index+1 != routine.length? const EdgeInsets.only(right: 5):const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(classes['type']),
                    Text(classes['code']),
                    Text("${classes['from']} - ${classes['to']}"),
                    Text(classes['prof']),
                  ],
                ),
              );
            }),
          )
        ),
    );
  }
}