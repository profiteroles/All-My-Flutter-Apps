import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:space_juke/presentation/tracks/tracks_controller.dart';
import 'package:space_juke/presentation/widgets/appbar.dart';
import 'package:space_juke/presentation/widgets/appbutton.dart';
import 'package:space_juke/presentation/widgets/input_field.dart';

class CreateTrackScreen extends GetWidget<TracksController> {
  const CreateTrackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JukeAppBar('Add Track', hasLead: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FormBuilder(
              // key: controller.fbKey,
              child: Column(
                children: const [
                  JukeInputField(title: 'Artist', hint: 'Artist Name', icon: Icons.play_arrow),
                  SizedBox(height: 10),
                  JukeInputField(title: 'Album', hint: 'Album Name', icon: Icons.play_arrow),
                  SizedBox(height: 10),
                  JukeInputField(title: 'Genre', hint: 'Genre', icon: Icons.play_arrow),
                  SizedBox(height: 10),
                  JukeInputField(title: 'Name', hint: 'Track Name', icon: Icons.play_arrow),
                  SizedBox(height: 10),
                  JukeInputField(title: 'Lenght', hint: 'Track Lenght', icon: Icons.play_arrow),
                  SizedBox(height: 10),
                  JukeInputField(title: 'Year', hint: 'Track Year', icon: Icons.play_arrow),
                ],
              ),
            ),
          ),
          AppButton(title: 'Submit', onTap: () {}, isLoading: false),
        ],
      ),
    );
  }
}
