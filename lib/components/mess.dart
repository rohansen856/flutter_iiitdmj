import 'package:flutter/material.dart';

class Mess extends StatefulWidget {
  const Mess({super.key});

  @override
  State<Mess> createState() => _MessState();
}

class _MessState extends State<Mess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 90,
    );
  }
}