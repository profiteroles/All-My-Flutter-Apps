import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class YearPickerField extends StatelessWidget {
  const YearPickerField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final years = List<int>.generate(60, (i) {
      int year = DateTime.now().year;
      return year - i;
    });
    return FormBuilderField(
      name: "year",
      initialValue: 2021,
      builder: (FormFieldState<dynamic> field) => InputDecorator(
        decoration: InputDecoration(
          labelText: "Year",
          labelStyle: Theme.of(context).textTheme.headline6,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          border: InputBorder.none,
          errorText: field.errorText,
        ),
        child: SizedBox(
          height: 90,
          child: CupertinoPicker(
            itemExtent: 30,
            children: years
                .map((y) => Text(
                      "$y",
                      style: Theme.of(context).textTheme.headline6,
                    ))
                .toList(),
            onSelectedItemChanged: (index) => field.didChange(years[index]),
          ),
        ),
      ),
    );
  }
}
