import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'bloc_base.dart';
import 'bloc_unit.dart';
import 'convert_widget.dart';

class Weight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InputWeightBloc>(
      blocBuilder: () => InputWeightBloc(),
      child: BlocProvider<ToGramBloc>(
        blocBuilder: () => ToGramBloc(),
        child: WeightApp(),
      ),
    );
  }
}

class WeightApp extends StatelessWidget {
  static const _kFontFam = 'Balance';
  static const _kFontPkg = null;

  static const IconData balance_scale =
      const IconData(0xf24e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  @override
  Widget build(BuildContext context) {
    InputWeightBloc inputWeightBloc = BlocProvider.of<InputWeightBloc>(context);
    ToGramBloc gramBloc = BlocProvider.of<ToGramBloc>(context);
    return Container(
      color: Colors.teal,
      child: Row(
        children: <Widget>[
          SizedBox(height: 150, width: 12),
          Flexible(
            flex: 5,
            child: Column(children: <Widget>[
              SizedBox(
                height: 32,
                child: UnitTitle(balance_scale, '  weight', Colors.blue[200]),
              ),
              SizedBox(
                height: 50,
                child: Container(
                  color: Colors.teal,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50,
                    child: Container(
                      color: Colors.teal[50],
                      child: TextFormField(
                        initialValue: '100',
                        textAlign: TextAlign.center,
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        showCursor: true,
                        style: TextStyle(
                          fontFamily: 'Righteous',
                          color: Colors.teal,
                          fontSize: 21,
                        ),
                        onChanged: (s) => inputWeightBloc.logic(s),
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
                  backgroundColor: Colors.teal,
                  looping: true,
                  itemExtent: 50,
                  onSelectedItemChanged: (i) => gramBloc.logic(i.toDouble()),
                  children: [
                    UnitPicker('g'),
                    UnitPicker('lb'),
                    UnitPicker('oz'),
                    UnitPicker('kg'),
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
              stream: inputWeightBloc.getStream,
              initialData: '100',
              builder: (context, str) {
                return StreamBuilder<double>(
                  stream: gramBloc.getStream,
                  initialData: 1.0,
                  builder: (context, dou) {
                    return Container(
                      height: 150,
                      child: CupertinoPicker(
                        backgroundColor: Colors.teal,
                        itemExtent: 50,
                        onSelectedItemChanged: null,
                        looping: true,
                        children: [
                          // 1 lb == 453.6 g
                          ConvertWidget(str.data, dou.data, 453.6, ' lb'),
                          // 1 oz = 28.35 g
                          ConvertWidget(str.data, dou.data, 28.35, ' oz'),
                          // 1 g == 1 g
                          ConvertWidget(str.data, dou.data, 1, ' g'),
                          // 1 kg == 1000 g
                          ConvertWidget(str.data, dou.data, 1000, ' kg'),
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
