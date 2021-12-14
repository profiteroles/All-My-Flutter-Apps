import '../../values/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JukeBottomNavBar extends StatelessWidget {
  const JukeBottomNavBar({
    required this.onIndexSelected,
    required this.index,
    this.image = '',
    Key? key,
  }) : super(key: key);

  final int index;
  final ValueChanged<int> onIndexSelected;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Theme.of(context).bottomAppBarColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(0),
                  icon: Icon(Icons.playlist_play, size: 34),
                  color: index == 0 ? AppColors.green : AppColors.lightGrey,
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(1),
                  icon: Icon(Icons.play_lesson, size: 28),
                  color: index == 1 ? AppColors.green : AppColors.lightGrey,
                ),
              ),
              Material(
                child: CircleAvatar(
                  backgroundColor: AppColors.purple,
                  radius: 28,
                  child: IconButton(
                    onPressed: () => onIndexSelected(2),
                    iconSize: 36,
                    icon: Icon(Icons.play_arrow),
                    color: index == 2 ? AppColors.green : AppColors.white,
                  ),
                ),
              ),
              Material(
                child: IconButton(
                  onPressed: () => onIndexSelected(3),
                  icon: Icon(index == 3 ? Icons.favorite : Icons.favorite_border, size: 32),
                  color: index == 3 ? Colors.red[600] : AppColors.lightGrey,
                ),
              ),
              InkWell(
                onTap: () => onIndexSelected(4),
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == 4 ? Theme.of(context).colorScheme.onSecondary : Colors.transparent,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(image),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
