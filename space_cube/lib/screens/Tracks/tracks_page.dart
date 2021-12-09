import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:space_cube/application/storage/local_storage_impl.dart';
import 'package:space_cube/values/theme/theme_service.dart';
import 'package:space_cube/widgets/toggle_button.dart';

class TracksPage extends StatefulWidget {
  const TracksPage({Key? key}) : super(key: key);

  @override
  _TracksPageState createState() => _TracksPageState();
}

class _TracksPageState extends State<TracksPage> with AutomaticKeepAliveClientMixin {
  bool isDarkMode = ThemeService().loadStoredTheme();

  @override
  bool get wantKeepAlive => true;

  void toggleOn(bool val) {
    setState(() => isDarkMode = val);
    ThemeService().changeThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracks'),
        actions: [
          DarkThemeToggle(value: isDarkMode, onToggle: toggleOn),
          SizedBox(width: 20),
          IconButton(onPressed: () => LocalStorageImpl().clearAllData(), icon: Icon(Icons.logout), iconSize: 32),
          SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {},
          child: Text('This SHoud be Dashboard Page'),
        ),
      ),
    );
  }
}
