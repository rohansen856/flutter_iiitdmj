import 'package:flutter/material.dart';
// import 'package:iiit/main.dart';
import 'package:iiit/models/routine_model.dart';
import 'package:iiit/models/settings_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class RoutineDatabase extends ChangeNotifier{
  static late Isar isar;

  //init
  static Future<void> initialize() async{
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([RoutineSchema, SettingsSchema], directory: dir.path);
  }

  //enter init routine data
  Future<void> getInitialRoutine() async{
    // final List<Routine> _future = (await supabase.from('routine').select()).cast<Routine>();
    // List<Routine> routineData = [];
    // for (var element in _future){
    //   final data = Routine()
    //     ..day=element.day
    //     ..type=element.type
    //     ..code=element.code
    //     ..prof=element.prof
    //     ..from=element.from
    //     ..to=element.to
    //     ..sem=element.to;
    //     routineData.add(data);
    // }
    // await isar.writeTxn(() => isar.routines.putAll(routineData));
    // final anydata = await isar.routines.get(5);
    // print(anydata);
  }

  final List<Routine> routineData = [];

  //update
  Future<void> createRoutine(List<Routine> data) async{
    await isar.writeTxn(() => isar.routines.putAll(data));
  }

  Future<void> readRoutine() async{
    List<Routine> fetchRoutines = await isar.routines.where().findAll();
    routineData.clear();
    routineData.addAll(fetchRoutines);
    notifyListeners();
  }
}