import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterStates {
  const CounterStates();
}

class InitialCounterState extends CounterStates {}

class SuccessCounterState extends CounterStates {
  final String type;

  SuccessCounterState(this.type);
}

/*class ErrorCounterState extends CounterStates {
  final String error;
  ErrorCounterState(this.error);
}*/
