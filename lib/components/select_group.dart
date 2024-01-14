import 'package:flutter/material.dart';
import 'package:group_select/group_select.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iiitdmj/database/settings_database.dart';

class SelectGroup extends StatefulWidget {
  const SelectGroup({super.key});

  @override
  State<SelectGroup> createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  final mybox = Hive.box('testBox');

  final controller = SelectGroupController<int>(
    lang: LangBadge.enUS,
    multiple: false,
    dark: false,
  );

  final  groupController = SelectGroupController<String>();

  @override
  Widget build(BuildContext context) {
    return // With groups items
      // With items
      GroupSelect<int>(
        activeColor: Colors.red,
        title: 'Select Semester',
        controller: controller,
        onChange: (value){
          SettingsDatabase().writeData('sem', value);
        },
        items: [
          Item(title: 'Semester 1', value: 1),
          Item(title: 'Semester 2', value: 2),
          Item(title: 'Semester 3', value: 3),
          Item(title: 'Semester 4', value: 4),
          Item(title: 'Semester 5', value: 5),
        ],
      );
  }
}