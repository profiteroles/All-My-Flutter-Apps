import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:va_tf_todo/values/theme/colors.dart';

class Utils {
  static Future<File?> pickMedia({bool? isGallery}) async {
    if (isGallery == null) return null;
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return null;

    // final file = File(pickedFile.path);
    final File? cropImage = await cropCustomImage(File(pickedFile.path));

    // if (cropImage == null) return null;

    return cropImage;

    // type().then((type) async {
    //   print(type == ImageSource.camera);
    //   if (type != null) {
    //     try {
    //       final XFile? image = await _picker.pickImage(source: type);
    //       if (image == null) return;

    //       final file = File(image.path);

    //       print(file.path);

    //       final String url = await dbFirestore.uploadProfileImage(file, userId);

    //       if (url.isNotEmpty) {
    //         dbFirestore.updateUser(userId, {'photo_url': url});
    //         authCtrl.initialiseUserModel(userId);
    //         EasyLoading.showInfo('image_uploaded'.tr);
    //       }
    //     } on PlatformException catch (e) {
    //       debugPrint(e.message);
    //     }
    //   }
    // });
  }

  static Future<File?> cropCustomImage(File imageFile) async => await ImageCropper.cropImage(
        aspectRatio: const CropAspectRatio(ratioX: 3, ratioY: 3),
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        androidUiSettings: androidUiSettings(),
        iosUiSettings: iosUiSettings(),
      );

  static IOSUiSettings iosUiSettings() => const IOSUiSettings(aspectRatioLockEnabled: false);
  static AndroidUiSettings androidUiSettings() => const AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: purple,
        toolbarWidgetColor: white,
        lockAspectRatio: true,
      );
}
