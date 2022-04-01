import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/logic/counter/counter_cubit.dart';
import 'package:sizer/sizer.dart';

class CountValue extends StatefulWidget {
  const CountValue({Key? key}) : super(key: key);

  @override
  State<CountValue> createState() => _CountValueState();
}

class _CountValueState extends State<CountValue>
    with SingleTickerProviderStateMixin {
  AnimationController? _zoomController;

  @override
  void dispose() {
    _zoomController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _zoomController?.forward();
    return ZoomIn(
        duration: const Duration(microseconds: 400),
        manualTrigger: true,
        controller: (controller) => _zoomController = controller,
        child: Text(
          '${context.select<CounterCubit, int>((bloc) => bloc.state.counter)}',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 80.0.sp),
        ));
  }
}
