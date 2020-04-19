import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_weight.dart';
import 'app_temp.dart';
import 'app_liquid.dart';

class UnitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Righteous',
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          elevation: 0.0,
          title: Center(child: Text('Kitchen Convertor')),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Weight(),
              Temp(),
              Liquid(),
            ],
          ),
        ),
      ),
    );
  }
}
