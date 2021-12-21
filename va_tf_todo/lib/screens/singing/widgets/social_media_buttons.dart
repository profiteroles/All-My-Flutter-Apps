import 'package:flutter/material.dart';
import 'package:va_tf_todo/values/utils/extention.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.bgColor,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(children: [Icon(icon), SizedBox(width: 1.0.wp), Text(title)]),
      style: TextButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.grey),
        minimumSize: Size(35.0.wp, 10.0.wp),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.white,
        backgroundColor: bgColor,
      ),
    );
  }
}
