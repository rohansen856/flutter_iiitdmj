import 'package:flutter/material.dart';
import 'package:iiitdmj/database/settings_database.dart';
import 'package:iiitdmj/themes/theme_provider.dart';
import 'package:provider/provider.dart';

/// Flutter code sample for [DropdownButton].

const List<int> list = [1, 2, 3, 4];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  int dropdownValue = SettingsDatabase().getData('sem');

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
          SettingsDatabase().writeData('sem', value);
        });
      },
      items: list.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
