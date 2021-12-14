import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_juke/domain/models/playlist.dart';
import 'package:space_juke/presentation/home/home_controller.dart';
import 'package:space_juke/presentation/widgets/appbar.dart';
import 'package:space_juke/presentation/widgets/empty_playlist.dart';

class PlaylistScreen extends GetWidget<HomeController> {
  PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: JukeAppBar('Playlist'),
      // body: EmptyPlaylist(onTap: () => controller.index(0)),
      body: controller.obx(
        (list) => ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            Playlist playlist = list[i];
            final icon = IconData(13);
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                height: Get.height * 0.11,
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Icon(icon, size: 40)),
                    Expanded(
                      flex: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(playlist.name, style: Theme.of(context).textTheme.headline6),
                          // Text(genre.icon, style: Theme.of(context).textTheme.bodyText1),
                          // Text(genre.parent.toString(), style: Theme.of(context).textTheme.caption),
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
