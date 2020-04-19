import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'bloc_base.dart';
import 'bloc_unit.dart';
import 'convert_widget.dart';

class Liquid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InputLiquidBloc>(
      blocBuilder: () => InputLiquidBloc(),
      child: BlocProvider<ToTspBloc>(
        blocBuilder: () => ToTspBloc(),
        child: LiquidApp(),
      ),
    );
  }
}

class LiquidApp extends StatelessWidget {
  static const _kFontFam = 'Beaker';
  static const _kFontPkg = null;

  static const IconData volume =
      const IconData(0xf0c3, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  @override
  Widget build(BuildContext context) {
    InputLiquidBloc inputLiquidBloc = BlocProvider.of<InputLiquidBloc>(context);
    ToTspBloc tspBloc = BlocProvider.of<ToTspBloc>(context);
    return Container(
      color: Colors.blue,
      child: Row(
        children: <Widget>[
          SizedBox(height: 150, width: 12),
          Flexible(
            flex: 5,
            child: Column(children: <Widget>[
              SizedBox(
                height: 32,
                child: UnitTitle(volume, ' volume', Colors.blue[200]),
              ),
              SizedBox(
                height: 50,
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50,
                    child: Container(
                      color: Colors.blue[50],
                      child: TextFormField(
                        initialValue: '1',
                        textAlign: TextAlign.center,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        showCursor: true,
                        style: TextStyle(
                          fontFamily: 'Righteous',
                          color: Colors.blue,
                          fontSize: 21,
                        ),
                        onChanged: (s) => inputLiquidBloc.logic(s),
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
                  backgroundColor: Colors.blue,
                  looping: true,
                  itemExtent: 50,
                  onSelectedItemChanged: (i) => tspBloc.logic(i.toDouble()),
                  children: [
                    UnitPicker('tsp'),
                    UnitPicker('cup'),
                    UnitPicker('gal'),
                    UnitPicker('oz'),
                    UnitPicker('mL'),
                    UnitPicker('L'),
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
              stream: inputLiquidBloc.getStream,
              initialData: '1',
              builder: (context, str) {
                return StreamBuilder<double>(
                  stream: tspBloc.getStream,
                  initialData: 1.0,
                  builder: (context, dou) {
                    return Container(
                      height: 150,
                      child: CupertinoPicker(
                        backgroundColor: Colors.blue,
                        itemExtent: 50,
                        onSelectedItemChanged: null,
                        looping: true,
                        children: [
                          // 1 oz == 6 tsp
                          ConvertWidget(str.data, dou.data, 6, ' oz'),
                          // 1 mL == 0.203 tsp
                          ConvertWidget(str.data, dou.data, 0.202884, ' mL'),
                          // 1 gal = 768 tsp
                          ConvertWidget(str.data, dou.data, 768, ' gal'),
                          // 1 cup == 48 tsp
                          ConvertWidget(str.data, dou.data, 48, ' cup'),
                          // 1 L == 202.88 tsp
                          ConvertWidget(str.data, dou.data, 202.884, ' L'),
                          // 1 tsp == 1 tsp
                          ConvertWidget(str.data, dou.data, 1, ' tsp'),
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
