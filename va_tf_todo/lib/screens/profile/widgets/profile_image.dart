import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/theme/colors.dart';
import 'package:va_tf_todo/values/utils/asset_path.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    required this.name,
    required this.image,
    Key? key,
  }) : super(key: key);

  final String image;
  final Widget name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(shape: BoxShape.circle, color: green),
          child: Padding(
            padding: EdgeInsets.all(.7.wp),
            child: CircleAvatar(radius: 50, foregroundImage: NetworkImage(image), backgroundImage: AssetImage(profileImage)),
          ),
        ),
        name,
      ],
    );
  }
}
