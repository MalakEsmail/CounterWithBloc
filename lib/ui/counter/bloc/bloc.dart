import 'package:bloc_counter_app/ui/counter/bloc/events.dart';
import 'package:bloc_counter_app/ui/counter/bloc/states.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialCounterState());

  static CounterBloc get(BuildContext context) => BlocProvider.of(context);
  int count = 0;
  @override
  Stream<CounterStates> mapEventToState(CounterEvents event) async* {
    if (event is IncrementCounterEvent) {
      yield* _changeState('in');
    }
    if (event is DecrementCounterEvent) {
      yield* _changeState('de');
    }
  }

  Stream<CounterStates> _changeState(String s) async* {
    switch (s) {
      case 'in':
        count++;
        break;
      case 'de':
        if (count != 0) {
          count--;
        }
        break;
    }
    yield SuccessCounterState(s);
  }
}
