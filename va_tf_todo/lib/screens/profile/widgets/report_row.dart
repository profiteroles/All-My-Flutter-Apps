import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class ReportStatusRow extends StatelessWidget {
  const ReportStatusRow({
    Key? key,
    required this.color,
    required this.results,
    required this.text,
  }) : super(key: key);
  final Color color;
  final int results;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 0.8.hp),
          height: 3.0.wp,
          width: 3.0.wp,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        SizedBox(width: 3.0.wp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('$results', style: Theme.of(context).textTheme.headline6!.copyWith(color: color)),
            SizedBox(height: 1.0.hp),
            Text(text, style: Theme.of(context).textTheme.subtitle1!.copyWith(color: color)),
          ],
        )
      ],
    );
  }
}
