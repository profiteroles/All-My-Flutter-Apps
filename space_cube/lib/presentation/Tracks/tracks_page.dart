import 'package:flutter/material.dart';
import 'package:space_cube/values/theme/theme_service.dart';

class TracksPage extends StatefulWidget {
  const TracksPage({Key? key}) : super(key: key);

  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text('Tracks')),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            ThemeService().changeThemeMode();
          },
          child: Text('Toggle me'),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
