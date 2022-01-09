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
    return total == 0
        ? const SizedBox.shrink()
        : UnconstrainedBox(
            child: SizedBox(
              width: 50.0.wp,
              height: 50.0.wp,
              child: CircularStepProgressIndicator(
                totalSteps: total == 0 ? 1 : total,
                currentStep: current,
                selectedStepSize: 18,
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: lightGrey,
                padding: 0,
                roundedCap: (_, __) => true,
                child: Center(
                  child: Text('${(current / total * 100).toInt()}%', style: Theme.of(context).textTheme.headline4),
                ),
              ),
            ),
          );
  }
}
