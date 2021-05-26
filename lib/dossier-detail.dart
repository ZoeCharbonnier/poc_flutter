import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:developer';


import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'model/dossier.model.dart';

class DetailPage extends StatelessWidget {
  final Dossier dossier;
  DetailPage(this.dossier);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("The details page"),
      ),
      body: Center(child: Text("The details page ${this.dossier.code}")),
    );
  }
}