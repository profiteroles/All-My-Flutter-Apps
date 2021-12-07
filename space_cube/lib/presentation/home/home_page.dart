import 'package:flutter/material.dart';
import 'package:space_cube/presentation/Playlists/playlists_page.dart';
import 'package:space_cube/presentation/Tracks/tracks_page.dart';
import 'package:space_cube/presentation/auth/account_page.dart';
import 'package:space_cube/presentation/favorities/favorities_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  final List<Widget> _screens = [
    TracksPage(),
    PlaylistsPage(),
    FavoritiesPage(),
    AccountPage(),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int itemIndex) {
    _pageController.jumpToPage(itemIndex);
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        // appBar: AppBar(title: const Text('Home Page')),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _screens,
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: _currentIndex == 2 ? Colors.red : Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).primaryColor.withOpacity(0.6),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.playlist_play_outlined), label: 'Tracks'),
            BottomNavigationBarItem(icon: Icon(Icons.playlist_add_check_rounded), label: 'Playlist'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_sharp), label: 'Favourites'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
        ),
      );
}
