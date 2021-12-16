import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:space_juke/presentation/tracks/tracks_controller.dart';
import 'package:space_juke/presentation/widgets/appbar.dart';
import 'package:space_juke/presentation/widgets/appbutton.dart';
import 'package:space_juke/presentation/widgets/input_field.dart';

import 'widgets/dropdown.dart';
import 'widgets/slider.dart';
import 'widgets/year_picker.dart';

class CreateTrackScreen extends GetWidget<TracksController> {
  const CreateTrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JukeAppBar('Add Track', hasLead: true),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FormBuilder(
              key: controller.fbKey,
              child: Column(
                children: [
                  JukeInputField(title: 'Artist', hint: 'Artist Name', hasIcon: false),
                  SizedBox(height: 10),
                  JukeInputField(title: 'Album', hint: 'Album Name', hasIcon: false),
                  SizedBox(height: 10),
                  DropIt(),
                  SizedBox(height: 10),
                  JukeInputField(title: 'Name', hint: 'Track Name', hasIcon: false),
                  SizedBox(height: 10),
                  JukeSlider(),
                  SizedBox(height: 10),
                  YearPickerField(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppButton(
                title: 'Submit',
                onTap: () {
                  controller.fbKey.currentState!.save();
                  print(controller.fbKey.currentState!.value);
                },
                isLoading: false),
          ),
        ],
      ),
    );
  }
}
