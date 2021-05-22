import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:poc_flutter/model/dossier.dart';

class DossierList extends StatefulWidget {
  const DossierList({Key key}) : super(key: key);

  @override
  _DossierListState createState() => _DossierListState();
}

class _DossierListState extends State<DossierList> {
  final _dossierlist = <Dossier>[];
  final _biggerFont = TextStyle(fontSize: 18.0);

  Map<String, dynamic> dossierMap = jsonDecode(dossier.json);
  var dossier = Dossier.fromJson(dossierMap);

  @override
  Widget build(BuildContext context) {
    final json = JSON.decode(
        DefaultAssetBundle.of(context).loadString("dossier.json")
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Dossiers"),
      ),
      body: _buildDossierList()


    );
  }

  Widget _buildDossierList(){
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
      //  if(index >= _dossierlist.length){
       //   _dossierlist.addAll(i.toString()).take(10);
       // }
        return _buildRow(_dossierlist[index]);
      },
    );
  }

  Widget _buildRow(Dossier dossier) {
    return ListTile(
      title: Text(
        dossier.code.toUpperCase(),
        style: _biggerFont,
      ),
    );
  }
}
