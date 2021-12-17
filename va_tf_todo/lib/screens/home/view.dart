import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/add_cart.dart';
import 'package:va_tf_todo/screens/home/widgets/task_card.dart';
import 'package:va_tf_todo/values/colors.dart';
import '../../values/utils/extention.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                'My List',
                style: TextStyle(
                  fontSize: 24.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                TaskCard(task: Task(title: 'title', icon: 0xe59c, color: 'FF2B60E6')),
                AddCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
