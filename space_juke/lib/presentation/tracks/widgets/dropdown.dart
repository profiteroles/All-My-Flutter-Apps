import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/instance_manager.dart';
import 'package:space_juke/presentation/genre/genre_controller.dart';

class DropIt extends StatelessWidget {
  DropIt({
    Key? key,
  }) : super(key: key);

  final GenreController genreController = Get.find<GenreController>();

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: 'genre',
      decoration: InputDecoration(contentPadding: EdgeInsets.all(15), labelText: 'Genre', labelStyle: Theme.of(context).textTheme.headline6),
      allowClear: true,
      hint: Text('Select Genre'),
      validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
      items: genreController.genres
          .map((genre) => DropdownMenuItem(
                value: genre.id,
                child: Text(genre.name),
              ))
          .toList(),
    );
  }
}
