import 'file.dart';

class Clipboard {

  Clipboard._();

  static File _currentValue;
  static bool filled = false;

  static void copy(File item) {
    _currentValue = item;
    filled = true;
  }

  static File paste() {
    filled = false;
    return _currentValue;
  }
}