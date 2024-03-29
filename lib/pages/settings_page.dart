import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iiitdmj/components/bottom_bar.dart';
import 'package:iiitdmj/components/dropdown_options.dart';
import 'package:iiitdmj/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 40),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, right: 7.0, left: 7.0),
        child: Column(
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Theme", style: TextStyle(color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary),),
                    CupertinoSwitch(
                      value: Provider.of<ThemeProvider>(context).isDarkMode,
                      onChanged: (n){
                        Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                      }
                    ),
                  ],
                ),
              ),
            ),
            const Gap(10),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Semester", style: TextStyle(color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary),),
                    const SemSelectButton()
                  ],
                ),
              ),
            ),
            const Gap(10),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
                borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Group", style: TextStyle(color: Provider.of<ThemeProvider>(context).themeData.colorScheme.inversePrimary),),
                    const SemSelectButton()
                  ],
                ),
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: const BottomBar(pageNo: 2,),
    );
  }
}