import 'package:flutter/material.dart';
import 'package:space_juke/values/constants.dart';

import 'app_elevated_button.dart';

class EmptyPlaylist extends StatelessWidget {
  const EmptyPlaylist({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('${IMAGE_PATH}playlist_logo.png', height: 90),
        SizedBox(height: 20),
        Text(
          'Looks like your Playlist is empty',
          textAlign: TextAlign.center,
          style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
        ),
        SizedBox(height: 20),
        Center(
          child: AppElevatedBtn(onTap: onTap, title: 'Add Tracks'),
        ),
      ],
    );
  }
}
