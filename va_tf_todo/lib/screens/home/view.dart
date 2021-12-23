import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/screens/home/controller.dart';
import 'package:va_tf_todo/screens/home/widgets/add_cart.dart';
import 'package:va_tf_todo/screens/home/widgets/add_dialog.dart';
import 'package:va_tf_todo/screens/home/widgets/task_card.dart';
import 'package:va_tf_todo/screens/profile/view.dart';
import 'package:va_tf_todo/screens/settings/view.dart';
import 'package:va_tf_todo/widgets/flat_appbar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: DragTarget<Task>(
        onAccept: controller.deleteTask,
        builder: (_, __, ___) => Obx(() => AnimatedOpacity(
              opacity: controller.fabOpacity(),
              duration: const Duration(milliseconds: 800),
              curve: Curves.bounceOut,
              child: Visibility(
                visible: controller.pageIndex() == 1 ? true : false,
                child: FloatingActionButton(
                  backgroundColor: controller.deleting.value ? Colors.red : Colors.blue,
                  child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
                  onPressed: () => controller.tasks.isNotEmpty
                      ? Get.to(() => const AddDialog(), transition: Transition.downToUp)
                      : EasyLoading.showInfo(
                          'First of all, Create a task',
                        ),
                ),
              ),
            )),
      ),
      bottomNavigationBar: const AppBottomNavBar(),
      body: SafeArea(
          child: Obx(() => IndexedStack(index: controller.pageIndex(), children: const [
                ProfileScreen(),
                TodoListScreen(),
                SettingScreen(),
              ]))),
    );
  }
}

class AppBottomNavBar extends GetView<HomeController> {
  const AppBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
          child: BottomNavigationBar(
            // selectedItemColor: Colors.red,
            // unselectedItemColor: Colors.grey,
            currentIndex: controller.pageIndex(),
            onTap: controller.setPage,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: ''),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoListScreen extends GetView<HomeController> {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const FlatAppBar('My List', hasInfoIcon: true),
        Obx(
          () => GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              ...controller.tasks
                  .map(
                    (task) => LongPressDraggable(
                      child: TaskCard(task: task),
                      data: task,
                      onDragStarted: () => controller.changeDeleting(true),
                      onDraggableCanceled: (_, __) => controller.changeDeleting(false),
                      onDragEnd: (_) => controller.changeDeleting(false),
                      feedback: Opacity(
                        opacity: .8,
                        child: TaskCard(task: task),
                      ),
                    ),
                  )
                  .toList(),
              const AddCard(),
            ],
          ),
        ),
      ],
    );
  }
}
