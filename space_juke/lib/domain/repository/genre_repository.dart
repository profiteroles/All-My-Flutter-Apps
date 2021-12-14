import 'package:get/get.dart';
import 'package:space_juke/domain/models/genre.dart';
import 'package:space_juke/domain/provider/genre_provider.dart';

class GenreRepository {
  final apiClient = Get.find<GenreAPIClient>();

  Future<List<Genre>> getAll() async {
    print('GenreRepository - getAll is Called');
    List<Genre> genres = <Genre>[];

    var response = await apiClient.getAll();
    // print('GenreRepository__________Genre Response__________');
    // print(response);
    // print('GenreRepository__________Response END__________');
    for (var genre in response) {
      genres.add(Genre.fromJson(genre));
    }
    return genres;
  }
}
