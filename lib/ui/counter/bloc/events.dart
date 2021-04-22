import 'package:flutter/cupertino.dart';

@immutable
abstract class CounterEvents {
  const CounterEvents();
}

class IncrementCounterEvent extends CounterEvents {}

class DecrementCounterEvent extends CounterEvents {}
