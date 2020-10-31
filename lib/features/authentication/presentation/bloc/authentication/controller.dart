import 'package:mvc_pattern/mvc_pattern.dart';

import 'bewertungmodel.dart';

//

class Controller extends ControllerMVC {
  /// Singleton Factory
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }
  static Controller _this;

  Controller._();

  /// Allow for easy access to 'the Controller' throughout the application.
  static Controller get con => _this;

  // int get counter => Model.counter;
  // int get counter => _counter;
  // int _counter = 0;
  // void incrementCounter() => _counter++;
  //
  // void incrementCounter() {
  //   /// The Controller knows how to 'talk to' the Model. It knows the name, but Model does the work.
  //   Model._incrementCounter();
  // }
}