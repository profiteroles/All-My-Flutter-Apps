import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_juke/domain/models/track.dart';
import 'package:space_juke/presentation/home/home_controller.dart';
import 'package:space_juke/presentation/tracks/tracks_controller.dart';

class TracksScreen extends GetWidget<TracksController> {
  const TracksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tracks')),
      body: controller.obx(
        (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            Track track = list[i];
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                height: Get.height * 0.11,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Icon(Icons.play_arrow, size: 40)),
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(track.album, style: Theme.of(context).textTheme.headline6),
                          Text(track.name, style: Theme.of(context).textTheme.bodyText1),
                          Text(track.artist, style: Theme.of(context).textTheme.caption),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
