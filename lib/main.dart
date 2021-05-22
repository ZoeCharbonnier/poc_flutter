import 'package:flutter/material.dart';
import 'package:poc_flutter/DossierList.dart';

import 'detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DossierList(),
    );
  }
}
