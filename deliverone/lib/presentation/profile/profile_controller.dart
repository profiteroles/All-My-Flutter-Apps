import 'package:get/get_state_manager/get_state_manager.dart';
import '../../domain/repository/api_repository.dart';
import '../../domain/repository/local_storage_repository.dart';

class ProfileController extends GetxController {
  ProfileController({required this.localInterface, required this.apiInterface});
  final LocalStorageInterface localInterface;
  final APIRepositoryInterface apiInterface;

  @override
  void onReady() {
    super.onReady();
    loadUser();
  }

  void loadUser() {}
}
