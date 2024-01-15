import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iiitdmj/database/routine_database.dart';
import 'package:iiitdmj/database/settings_database.dart';
import 'package:iiitdmj/themes/theme_provider.dart';
import 'package:provider/provider.dart';

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
  final List<dynamic> routine = [];
  int sem=0;
  final _mybox = Hive.box('testBox');
  
  Future<void> func() async{
    sem = SettingsDatabase().getData('sem');
    _mybox.delete('routine');
    await RoutineDatabase().getRoutine(sem);
    final List<dynamic> data = _mybox.get('routine');
    data.sort((a, b) => a['from'].compareTo(b['from']));
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
    return  SizedBox(
      height: 90.0,
      child: routine.isNotEmpty
      ? ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: routine.length,
        itemBuilder: ((context, index) {
          final classes = routine[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 90.0,
                width: 150,
                color: Colors.blue,
                // margin: index+1 != routine.length? const EdgeInsets.only(right: 5):const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(classes['type']),
                    Text(classes['code']),
                    Text("${classes['from']} - ${classes['to']}"),
                    Text(classes['prof']),
                  ],
                ),
              ),
            ),
          );
        }),
      )
      : MaterialButton(
        onPressed: ()=> func(),
        color: Colors.blue, 
        child: sem!=0? CircularProgressIndicator(color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary,): const Text("set the semester in settings"),
      )
    );
  }
}