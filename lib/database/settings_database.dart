import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsDatabase extends ChangeNotifier{
  
  void writeData(name, data){
    final mybox = Hive.box('testBox');
    if(name == 'sem'){
      mybox.put('settings.sem', data);
      print(mybox.get('settings.sem'));
    }
    else if(name == 'mess'){
      mybox.put('settings.mess', data);
      print(mybox.get('settings.mess'));
    }
  }
}