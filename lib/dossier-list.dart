import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'dossier-detail.dart';
import 'model/dossier.model.dart';


class DossierList extends StatefulWidget {
  @override
  _dossierListState createState() => _dossierListState();
}

class _dossierListState extends State<DossierList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dossiers'),),
      body: Center(
        child: FutureBuilder(builder: (context, snapshot){
          List<Dossier> dossiers =  dossierFromJson(snapshot.data.toString());
          return ListView.builder(
              itemCount: dossiers.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(dossiers[index].code),
                  subtitle: Text(dossiers[index].street),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage(dossiers[index]))
                    );
                  },
                );
              }
          );
        }, future: DefaultAssetBundle.of(context).loadString("assets/dossier.json"),
        ),
      ),
    );
  }
}
