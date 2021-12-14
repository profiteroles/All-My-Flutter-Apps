import 'package:flutter/material.dart';
import 'package:space_juke/presentation/widgets/appbar.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: JukeAppBar('Favourites'),
      body: Center(child: Text('Favs Screen')),
    );
  }
}
