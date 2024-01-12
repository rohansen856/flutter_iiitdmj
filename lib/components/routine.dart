import 'package:flutter/material.dart';
import 'package:iiit/main.dart';

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
  final _future = supabase.from('routine').select();

  // List<RoutineData> classes = [
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  //   RoutineData("theory", "NS1001", "YSK"),
  // ];


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
          height: 90.0, // Set the desired height of your list
          color: Colors.blue,
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: _future,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator(color: Colors.white,));
              }
              final routine = snapshot.data!;
              return ListView.builder(
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
              );
            },
          ),
        ),
    );
  }
}