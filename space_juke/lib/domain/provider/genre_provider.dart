import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/values/constants.dart';

class GenreAPIClient extends GetConnect {
  final storage = GetStorage(STORAGE_KEY);

  getAll() async {
    print('GenreAPIClient - getAll is Called');
    final token = storage.read(SESSION_KEY)['token'];
    var response;
    try {
      response = await get(
        BASE_URL + 'genres',
        headers: {"Authorization": 'Bearer ' + token},
      );

      return response.body['data'];
    } catch (e) {
      print('GenreAPIClient - getAll caugth an Error');
      print(e);
      print('GenreAPIClient_______END ERROR______');
      return response.body;
    }
  }
}
