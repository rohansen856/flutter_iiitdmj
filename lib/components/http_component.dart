import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<dynamic> createAlbum() async {
    final response = await http.post(
    Uri.parse('http://192.168.31.232:3000/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': "title",
    }),
  );
  print("object");
  print(response.statusCode);
  return response;
}

class HttpCheck extends StatefulWidget {
  const HttpCheck({super.key});

  @override
  State<HttpCheck> createState() {
    return _HttpCheckState();
  }
}

class _HttpCheckState extends State<HttpCheck> {
  String newstr = "";
  @override
  void initState() {
    // TODO: implement initState
    createAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: Column(children: [Text("${createAlbum()}"), MaterialButton(child: Text("press"), onPressed:(){ createAlbum();})]),
        ),
      ),
    );
  }
}