import 'package:bloc_counter_app/ui/counter/bloc/bloc.dart';
import 'package:bloc_counter_app/ui/counter/bloc/events.dart';
import 'package:bloc_counter_app/ui/counter/bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(),
      child: BlocConsumer<CounterBloc, CounterStates>(
        listener: (BuildContext context, CounterStates state) {
          if (state is SuccessCounterState) {
            print(state.type);
          }
        },
        builder: (BuildContext context, CounterStates state) {
          int count = CounterBloc.get(context).count;
          return Scaffold(
            appBar: AppBar(
              title: Text('Bloc Counter'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      CounterBloc.get(context).add(IncrementCounterEvent());
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(count.toString()),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      CounterBloc.get(context).add(DecrementCounterEvent());
                    },
                    child: Icon(Icons.remove),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
