import 'package:flutter/material.dart';
import 'package:iiitdmj/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class Mess extends StatefulWidget {
  const Mess({super.key});

  @override
  State<Mess> createState() => _MessState();
}

class _MessState extends State<Mess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<ThemeProvider>(context).themeData.colorScheme.secondary,
      height: 90,
      child: const Center(child: Text("Mess Menu")),
    );
  }
}