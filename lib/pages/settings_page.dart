import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text("Theme"),
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
            const DropdownButtonExample()
          ],
        )
      ),
      bottomNavigationBar: const BottomBar(pageNo: 2,),
    );
  }
}