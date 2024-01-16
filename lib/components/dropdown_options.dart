import 'package:flutter/material.dart';
import 'package:iiitdmj/database/settings_database.dart';
import 'package:iiitdmj/themes/theme_provider.dart';
import 'package:provider/provider.dart';

/// Flutter code sample for [DropdownButton].

const List<int> sem = [1, 2, 3, 4];

class SemSelectButton extends StatefulWidget {
  const SemSelectButton({super.key});

  @override
  State<SemSelectButton> createState() => _SemSelectButtonState();
}

class _SemSelectButtonState extends State<SemSelectButton> {
  int dropdownValue = 1;//SettingsDatabase().getData('sem');

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward, 
        color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary,
      ),
      elevation: 16,
      style: TextStyle(color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary),
      underline: Container(
        height: 2,
        color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary,
      ),
      onChanged: (int? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          SettingsDatabase().writeData('sem', dropdownValue);
        });
      },
      items: sem.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}

const List<int> group = [1,2,3,4];

class GroupSelectButton extends StatefulWidget {
  const GroupSelectButton({super.key});

  @override
  State<GroupSelectButton> createState() => _GroupSelectButtonState();
}

class _GroupSelectButtonState extends State<GroupSelectButton> {
  late int dropdownValue =1;// SettingsDatabase().getData('sem')??1;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward, 
        color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary,
      ),
      elevation: 16,
      style: TextStyle(color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary),
      underline: Container(
        height: 2,
        color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary,
      ),
      onChanged: (int? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          SettingsDatabase().writeData('sem', dropdownValue);
        });
      },
      items: group.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
