import 'package:flutter/material.dart';

//
//
//
class ConvertTemp extends StatelessWidget {
  final String data1;
  final double data2;
  final String unit;
  ConvertTemp(this.data1, this.data2, this.unit);
  @override
  Widget build(BuildContext context) {
    double result;
    if (data2 == 0.0) {
      result = (double.parse(data1));
    } else
      result = ((double.parse(data1)) - 32) / 1.8;

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      // using Text inside a Row
      Flexible(
        child: Text(
          result.toInt() == result
              ? result.toInt().toString()
              : result.toStringAsFixed(2),
          style: TextStyle(fontFamily: 'Righteous', color: Colors.white),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      Flexible(
        child: Text(
          '\u00B0C',
          style: TextStyle(fontFamily: 'Righteous', color: Colors.white),
        ),
      ),
    ]);
  }
}

//
//
//
class UnitPicker extends StatelessWidget {
  final String unit;
  UnitPicker(this.unit);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        unit,
        style: TextStyle(
          fontFamily: 'Righteous',
          color: Colors.white,
        ),
      ),
    );
  }
}

//
//
//
class UnitTitle extends StatelessWidget {
  final IconData unitIcon;
  final String unitName;
  final Color nameColor;
  UnitTitle(this.unitIcon, this.unitName, this.nameColor);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Icon(
        unitIcon,
        size: 16,
        color: nameColor,
      ),
      Text(
        unitName,
        style: TextStyle(
          color: nameColor,
          fontSize: 12,
        ),
      )
    ]);
  }
}
