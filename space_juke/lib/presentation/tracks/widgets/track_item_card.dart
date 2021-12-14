import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:space_juke/domain/models/track.dart';
import 'package:space_juke/values/routes/routes.dart';
import 'package:space_juke/values/themes/theme.dart';

class TrackItemCard extends StatelessWidget {
  const TrackItemCard({
    Key? key,
    required this.track,
  }) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.showTrack, arguments: track),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Slidable(
          startActionPane: ActionPane(
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                spacing: 5,
                backgroundColor: AppColors.purple,
                label: 'Edit',
                icon: Icons.edit,
                onPressed: (context) {},
              ),
              SlidableAction(
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: 'Delete',
                onPressed: (context) {},
              )
            ],
          ),
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
        ),
      ),
    );
  }
}
