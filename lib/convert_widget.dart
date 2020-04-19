import 'package:flutter/material.dart';

//
//
//
class ConvertWidget extends StatelessWidget {
  final String data1;
  final double data2;
  final double factor;
  final String unit;
  ConvertWidget(this.data1, this.data2, this.factor, this.unit);
  @override
  Widget build(BuildContext context) {
    //
    // [1] unit == [factor] g
    //
    double result = (double.parse(data1) * data2 / factor);

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
          unit,
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
