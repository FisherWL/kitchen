import 'bloc_base.dart';
import 'package:rxdart/rxdart.dart';

//
//
//
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

//
// weight
//
class InputWeightBloc implements BlocBase {
  PublishSubject<String> subjectCtrl = PublishSubject<String>();
  //StreamSink get getSink => ctrl.sink;
  Stream<String> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void logic(String s) {
    if (s == '' || !isNumeric(s)) {
      return subjectCtrl.sink.add('0');
    }
    return subjectCtrl.sink.add(s);
  }
  // void logicCHN() => subjectCtrl.sink.add('CHN');
}

class ToGramBloc implements BlocBase {
  PublishSubject<double> subjectCtrl = PublishSubject<double>();
  //StreamSink get getSink => ctrl.sink;
  Stream<double> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void logic(d) {
    switch (d) {
      // 1 g = 1 g
      case 0:
        {
          subjectCtrl.sink.add(1);
        }
        break;
      // 1 lb = 453.6 g
      case 1:
        {
          subjectCtrl.sink.add(453.6);
        }
        break;
      // 1 oz = 28.35 g
      case 2:
        {
          subjectCtrl.sink.add(28.35);
        }
        break;
      // 1 kg == 1000 g
      case 3:
        {
          subjectCtrl.sink.add(1000);
        }
        break;
    }
  }
}

//
// liquid
//
class InputLiquidBloc implements BlocBase {
  PublishSubject<String> subjectCtrl = PublishSubject<String>();
  //StreamSink get getSink => ctrl.sink;
  Stream<String> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void logic(String s) {
    if (s == '' || !isNumeric(s)) {
      return subjectCtrl.sink.add('0');
    }
    return subjectCtrl.sink.add(s);
  }
  // void logicCHN() => subjectCtrl.sink.add('CHN');
}

class ToTspBloc implements BlocBase {
  PublishSubject<double> subjectCtrl = PublishSubject<double>();
  //StreamSink get getSink => ctrl.sink;
  Stream<double> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void logic(d) {
    switch (d) {
      // 1 tsp =  1 tsp
      case 0:
        {
          subjectCtrl.sink.add(1);
        }
        break;
      // 1 cup = 48 tsp
      case 1:
        {
          subjectCtrl.sink.add(48);
        }
        break;
      // 1 gal = 768 tsp
      case 2:
        {
          subjectCtrl.sink.add(768);
        }
        break;
      // 1 oz = 6 tsp
      case 3:
        {
          subjectCtrl.sink.add(6);
        }
        break;
      // 1 mL = 0.202884 tsp
      case 4:
        {
          subjectCtrl.sink.add(0.202884);
        }
        break;
      // 1 L = 202.88 tsp
      case 5:
        {
          subjectCtrl.sink.add(202.884);
        }
        break;
    }
  }
}

//
// teamperature
//
class InputTempBloc implements BlocBase {
  PublishSubject<String> subjectCtrl = PublishSubject<String>();
  //StreamSink get getSink => ctrl.sink;
  Stream<String> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void logic(String s) {
    if (s == '' || !isNumeric(s)) {
      return subjectCtrl.sink.add('0');
    }
    return subjectCtrl.sink.add(s);
  }
}

class ToOcBloc implements BlocBase {
  PublishSubject<double> subjectCtrl = PublishSubject<double>();
  //StreamSink get getSink => ctrl.sink;
  Stream<double> get getStream => subjectCtrl.stream;

  void dispose() {
    subjectCtrl.close();
  }

  void logic(d) {
    switch (d) {

      // C case
      case 0:
        {
          subjectCtrl.sink.add(0);
        }
        break;
      // F case
      case 1:
        {
          subjectCtrl.sink.add(1);
        }
        break;
    }
  }
}
