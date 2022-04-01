part of 'counter_cubit.dart';

@immutable
abstract class CounterStateABS {
  int counter;
  CounterStateABS({
    required this.counter,
  });
}

class CounterState extends CounterStateABS {
  CounterState({required int counter}) : super(counter: counter);
}
