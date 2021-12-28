import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class ProgressCircle extends StatelessWidget {
  const ProgressCircle({
    Key? key,
    required this.total,
    required this.current,
  }) : super(key: key);

  final int total;
  final int current;

  @override
  Widget build(BuildContext context) {
    final String precentage = (current / total * 100).toString();
    return UnconstrainedBox(
      child: SizedBox(
        width: 50.0.wp,
        height: 50.0.wp,
        child: CircularStepProgressIndicator(
          totalSteps: total == 0 ? 1 : total,
          currentStep: current,
          stepSize: 10,
          selectedStepSize: 18,
          selectedColor: green.withOpacity(.8),
          unselectedColor: veryLightGrey,
          padding: 0,
          roundedCap: (index, bool value) => index == 0 ? value : false,
          child: Center(child: Text('$precentage %', style: Theme.of(context).textTheme.headline4)),
        ),
      ),
    );
  }
}
