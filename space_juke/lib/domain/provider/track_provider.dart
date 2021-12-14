import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:space_juke/values/constants.dart';

class TrackAPIClient extends GetConnect {
  final storage = GetStorage(STORAGE_KEY);

  getAll() async {
    print('TrackAPIClient - getAll is Called');
    final token = storage.read(SESSION_KEY)['token'];
    try {
      var response = await get(
        BASE_URL + 'tracks',
        headers: {"Authorization": 'Bearer ' + token},
      );
      return response.body['data'];
    } catch (e) {
      print('TrackAPIClient - getAll caugth an Error');
      print(e);
      print('_______END ERROR______');
    }
  }
}
