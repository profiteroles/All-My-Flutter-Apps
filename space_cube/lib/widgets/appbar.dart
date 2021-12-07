import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar JukeAppBar() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      automaticallyImplyLeading: false,
    );
