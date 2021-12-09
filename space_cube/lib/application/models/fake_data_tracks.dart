import 'package:space_cube/application/models/genre.dart';
import 'package:space_cube/application/models/track.dart';

final List<Track> fakeDataTracks = [
  Track(
    id: 1,
    year: 1997,
    artist: 'Tracks Artist',
    album: 'Track album',
    name: 'Track name',
    genre: Genre(
      id: 1,
      name: 'Genre name',
      icon: 'Genre icon',
    ),
  ),
  Track(
    id: 2,
    year: 2000,
    artist: 'Tracks Artist',
    album: 'Track album',
    name: 'Track name',
    genre: Genre(
      id: 1,
      name: 'Genre name',
      icon: 'Genre icon',
    ),
  )
];
