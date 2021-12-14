import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_juke/presentation/tracks/tracks_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:space_juke/presentation/widgets/appbar.dart';
import 'package:space_juke/values/themes/theme.dart';
import 'widgets/track_item_card.dart';

class TracksScreen extends GetWidget<TracksController> {
  const TracksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: JukeAppBar('Tracks'),
      body: controller.obx(
        (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) => TrackItemCard(track: list[i]),
        ),
      ),
    );
  }
}
