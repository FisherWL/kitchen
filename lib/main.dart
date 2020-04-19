import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'unit_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: UnitApp());
  }
}
