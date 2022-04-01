import 'package:counter_app/logic/counter/counter_cubit.dart';
import 'package:counter_app/presentation/screens/counter_screen/widgets/animated_circle.dart';
import 'package:counter_app/presentation/screens/counter_screen/widgets/background.dart';
import 'package:counter_app/presentation/screens/counter_screen/widgets/count_touch.dart';
import 'package:counter_app/presentation/screens/counter_screen/widgets/count_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        const Background(),
        Positioned(
          child: Stack(
            alignment: Alignment.center,
            children: const [
              AnimatedCircles(),
              Positioned(child: CountValue()),
            ],
          ),
          top: 10.0.h,
        ),
        Positioned(
            bottom: 48,
            child: CountTouch(
              child: const Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: 56,
              ),
              color: Theme.of(context).accentColor,
              value: context
                  .select<CounterCubit, int>((bloc) => bloc.state.counter),
              onChanged: (int newValue, int oldValue) {
                if (oldValue > newValue) {
                  context.read<CounterCubit>().decrement();
                } else {
                  context.read<CounterCubit>().increment();
                }
              },
            ))
      ],
    ));
  }
}
