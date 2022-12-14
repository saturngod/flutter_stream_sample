import 'dart:async';

class Global {
  static StreamController<double> uploadProgressController = StreamController<double>.broadcast();//allow multiple subscribe
}