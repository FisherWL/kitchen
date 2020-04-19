import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'bloc_base.dart';
import 'bloc_unit.dart';
import 'convert_widget.dart';

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InputTempBloc>(
      blocBuilder: () => InputTempBloc(),
      child: BlocProvider<ToOcBloc>(
        blocBuilder: () => ToOcBloc(),
        child: TempApp(),
      ),
    );
  }
}

class TempApp extends StatelessWidget {
  static const _kFontFam = 'Temperature';
  static const _kFontPkg = null;

  static const IconData volume =
      const IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  @override
  Widget build(BuildContext context) {
    InputTempBloc inputTempBloc = BlocProvider.of<InputTempBloc>(context);
    ToOcBloc ocBloc = BlocProvider.of<ToOcBloc>(context);
    return Container(
      color: Colors.orange,
      child: Row(
        children: <Widget>[
          SizedBox(height: 150, width: 12),
          Flexible(
            flex: 5,
            child: Column(children: <Widget>[
              SizedBox(
                height: 32,
                child: UnitTitle(volume, 'temperature', Colors.orange[200]),
              ),
              SizedBox(
                height: 50,
                child: Container(
                  color: Colors.orange,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50,
                    child: Container(
                      color: Colors.orange[50],
                      child: TextFormField(
                        initialValue: '200',
                        textAlign: TextAlign.center,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        showCursor: true,
                        style: TextStyle(
                          fontFamily: 'Righteous',
                          color: Colors.orange,
                          fontSize: 21,
                        ),
                        onChanged: (s) => inputTempBloc.logic(s),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32)
            ]),
          ),
          SizedBox(height: 150, width: 4),
          Flexible(
            flex: 4,
            child: Container(
              height: 150,
              child: CupertinoPicker(
                  backgroundColor: Colors.orange,
                  looping: true,
                  itemExtent: 50,
                  onSelectedItemChanged: (i) => ocBloc.logic(i.toDouble()),
                  children: [
                    UnitPicker('\u00B0C'),
                    UnitPicker('\u00B0F'),
                  ]),
            ),
          ),
          SizedBox(
            height: 150,
            width: 20,
            child: Center(
              child: Text('=',
                  style: TextStyle(
                      fontFamily: 'Righteous',
                      fontSize: 28,
                      color: Colors.white)),
            ),
          ),
          Flexible(
            flex: 7,
            child: StreamBuilder<String>(
              stream: inputTempBloc.getStream,
              initialData: '200',
              builder: (context, str) {
                return StreamBuilder<double>(
                  stream: ocBloc.getStream,
                  initialData: 0.0,
                  builder: (context, dou) {
                    // convert to C
                    double toC;
                    if (dou.data == 0.0) {
                      toC = (double.parse(str.data));
                    } else
                      toC = ((double.parse(str.data)) - 32) / 1.8;

                    return Container(
                      height: 150,
                      child: CupertinoPicker(
                        backgroundColor: Colors.orange,
                        itemExtent: 50,
                        onSelectedItemChanged: null,
                        looping: true,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // using Text inside a Row
                                Flexible(
                                  child: Text(
                                    (toC * 1.8 + 32).toInt() == (toC * 1.8 + 32)
                                        ? (toC * 1.8 + 32).toInt().toString()
                                        : (toC * 1.8 + 32).toStringAsFixed(2),
                                    style: TextStyle(
                                        fontFamily: 'Righteous',
                                        color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    '\u00B0F',
                                    style: TextStyle(
                                        fontFamily: 'Righteous',
                                        color: Colors.white),
                                  ),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // using Text inside a Row
                                Flexible(
                                  child: Text(
                                    toC.toInt() == toC
                                        ? toC.toInt().toString()
                                        : toC.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontFamily: 'Righteous',
                                        color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    '\u00B0C',
                                    style: TextStyle(
                                        fontFamily: 'Righteous',
                                        color: Colors.white),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
