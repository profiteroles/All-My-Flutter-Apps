import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:space_juke/domain/repository/tracks_repository.dart';

class TracksController extends GetxController with StateMixin {
  final repo = Get.find<TracksRepository>();

  final fbKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
    loadTracks();
  }

  void loadTracks() async {
    print('TracksController - loadTracks is Called');
    await repo.getAll().then((value) {
      change(value, status: RxStatus.success());
    }).catchError((err) {
      print('TracksController - loadTracks - catchError');
      change(null, status: RxStatus.error('Error has occoured'));
    });
  }
}
