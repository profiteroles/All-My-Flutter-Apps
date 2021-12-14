import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:space_juke/domain/models/track.dart';
import 'package:space_juke/presentation/widgets/appbar.dart';

class ShowTrackScreen extends StatelessWidget {
  ShowTrackScreen({Key? key}) : super(key: key);
  final Track track = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: JukeAppBar('Track - Name', hasLead: true),
        body: Column(
          children: <Widget>[
            Expanded(flex: 3, child: Placeholder()),
            Expanded(
              flex: 10,
              child: Card(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Table(
                    children: [
                      TableRow(children: const [
                        Text('Album'),
                        Text('Artist'),
                        Text('Name'),
                        Text('Genre'),
                      ]),
                      TableRow(children: [
                        Text(track.album),
                        Text(track.artist),
                        Text(track.name),
                        Text(track.genre.name),
                      ])
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
