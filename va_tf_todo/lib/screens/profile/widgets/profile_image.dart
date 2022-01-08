import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/asset_path.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    required this.name,
    required this.image,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String image;
  final Widget name;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 33.0.wp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 3, color: green),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: FadeInImage.assetNetwork(placeholder: profileImage, image: image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0.wp, left: 23.0.wp),
              child: CircleAvatar(
                backgroundColor: green,
                radius: 20,
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, color: Colors.white),
                  onPressed: onPressed,
                ),
              ),
            ),
          ],
        ),
        name,
      ],
    );
  }
}
