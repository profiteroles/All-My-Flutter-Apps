import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:va_tf_todo/data/models/activity.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/activity_repository.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';
import 'package:va_tf_todo/screens/settings/controller.dart';
import 'package:va_tf_todo/screens/show/widgets/reminder_dialog.dart';
import 'package:va_tf_todo/values/utils/asset_path.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/icons.dart';

class HomeController extends GetxController {
  HomeController({required this.activityRepository});

  static HomeController instance = Get.find();

  final ActivityRepository activityRepository;
  final authCtrl = AuthController.instance;
  final settingCtrl = SettingsController.instance;

  //Task Related
  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final taskTitleCtrl = TextEditingController();

  RxInt iconIndex = 0.obs;
  RxInt priorityIndex = 0.obs;
  RxBool deleting = false.obs;
  RxBool isEmptyError = false.obs;
  RxString activityTitle = ''.obs;

  final currentActivity = Rx<Activity?>(null);
  RxList<Activity> activities = <Activity>[].obs;
  RxList doingTasks = <Task>[].obs;
  RxList doneTasks = <Task>[].obs;

  //TODO WFT make it animate
  RxDouble taskBoxHeight = 8.0.hp.obs;
  RxInt pageIndex = 1.obs;
  RxDouble fabOpacity = 1.0.obs;
  // final TimeOfDay defaultTime = TimeOfDay.now().replacing(hour: 11, minute: 30);
  // //TODO CHECK & DELETE
  // Rx<TimeOfDay> taskTime = TimeOfDay.now().replacing(hour: 11, minute: 30).obs;

  @override
  void onInit() async {
    super.onInit();
    debugPrint('HomeController - initialised');
    activities.assignAll(activityRepository.readActivities());
    ever(activities, (_) => activityRepository.writeActivities(activities));
  }

  @override
  void onClose() {
    debugPrint('HomeController - Closed');
    super.onClose();
    editCtrl.dispose();
  }

  void setPage(int index) {
    debugPrint('HomeController - setPage is Called Index is: $index');
    index == 1 ? fabOpacity(1) : fabOpacity(0);
    pageIndex(index);
  }

  void doneTask(Task task) {
    debugPrint('HomeController - doneTask is Called title is: ${task.title}');
    doingTasks.remove(task);
    doneTasks.add(task.copyWith(isdone: true));
    doingTasks.refresh();
    doneTasks.refresh();
  }

  void changeTasks(List<Task> select) {
    debugPrint('HomeController - changeTasks is Called');
    doingTasks.clear();
    doneTasks.clear();

    for (var task in select) {
      if (task.isdone) {
        doneTasks.add(task);
      } else {
        doingTasks.add(task);
      }
    }
  }

  void setTaskReminder(Task task, bool isDone) async {
    debugPrint('HomeController - onTimeChanged is Called');
    if (isDone) {
      EasyLoading.showInfo(
        'Task Completed on ' + DateFormat.yMMMMEEEEd().format(DateTime.parse(task.createdAt)),
        duration: const Duration(milliseconds: 700),
      );
    } else {
      Get.dialog(const ReminderDialog()).then((date) {
        task.alarmAt = date;
        doingTasks.refresh();
        if (date != null) {
          EasyLoading.showSuccess('Reminder is Set $date');
          settingCtrl.nService.taskReminder(DateTime.parse(date), task.title);
        }
      });
    }
  }

  bool updateActivity(Activity activity, String taskTitle) {
    debugPrint('HomeController - updateActivity is called receive task - title is: $taskTitle \n$activity');
    bool isExist = activity.tasks!.any((t) => t.title == taskTitle);

    if (isExist) {
      return false;
    } else {
      Task task = Task(title: taskTitle, isdone: false, createdAt: DateTime.now().toString());
      Activity newActivity = currentActivity()!.copyWith(tasks: [...?activity.tasks, task]);
      int activityIndexValue = activities().indexOf(currentActivity()!);
      activities.value[activityIndexValue] = newActivity;

      activities.refresh();
      return true;
    }
  }

  void changeActivity(Activity? activity) {
    debugPrint('HomeController - changeActivity is called receive value is: $activity');
    activityTitle.value = activity?.title ?? '';
    currentActivity.value = activity;
  }

  void deletingActivity(bool value) {
    debugPrint('HomeController - changeDeleting is called receive value is: $value');
    deleting.value = value;
  }

  void deleteActivity(Activity? activity) {
    debugPrint('HomeController - deleteActivity is called receive activity is: $activity');

    activities.remove(activity);
    EasyLoading.showSuccess('removed'.tr);
  }

  void addTaskFromDialog() {
    debugPrint('HomeController - addTaskFromDialog is called');
    if (formKey.currentState!.validate()) {
      if (currentActivity.value == null) {
        EasyLoading.showError('error_choose_activity'.tr);
      } else {
        final bool success = updateActivity(currentActivity()!, editCtrl.text);

        if (success) {
          toHomePage(update: false);
          EasyLoading.showSuccess('${currentActivity.value!.title} ' + 'task'.tr + ' ' + 'added'.tr); //'Task added to your ${currentActivity.value!.title}');
        } else {
          EasyLoading.showError('error_exist'.tr);
        }
        editCtrl.clear();
      }
    }
  }

  bool addTask(String title) {
    debugPrint('HomeController - addTask is called receive task is: $title');
    bool isExist = currentActivity()!.tasks!.any((t) => t.title == title);
    if (isExist) {
      return false;
    } else {
      Task task = Task(title: title, isdone: false, createdAt: DateTime.now().toString());
      doingTasks.add(task);
      return true;
    }
  }

  void updateTasks() {
    debugPrint('HomeController - updateTasks is called');
    List<Task> newTasks = <Task>[];
    newTasks.addAll([...doingTasks, ...doneTasks]);
    Activity newTask = currentActivity.value!.copyWith(
      tasks: newTasks,
      priority: getPriorities()[priorityIndex()].toHex(),
      icon: getIcons()[iconIndex()].icon!.codePoint,
      color: getIcons()[iconIndex()].color!.toHex(),
      title: taskTitleCtrl.text,
    );
    int oldIdx = activities.indexOf(currentActivity.value);
    activities[oldIdx] = newTask;
    activities.refresh();
  }

  void toHomePage({bool update = true}) {
    debugPrint('HomeController - Back to Home Screen');
    if (update) updateTasks();
    Get.back();
    editCtrl.clear();
    changeActivity(null);
    priorityIndex(0);
  }

  void deleteIsDoneTask(Task task) {
    debugPrint('HomeController - deleteIsDoneTask is called');
    doneTasks.remove(task);
  }

  bool isTaskEmpty(Activity activity) {
    debugPrint('HomeController - isTaskEmpty is called');
    return activity.tasks == null || activity.tasks!.isEmpty;
  }

  int getDoneTask(Activity activity) {
    debugPrint('HomeController - getDoneTask is called');
    var res = 0;
    var tasks = activity.tasks;
    for (Task item in tasks!) {
      if (item.isdone) {
        res += 1;
      }
    }
    return res;
  }

  // void readAll() {
  //   final storage = GetStorage();
  //   print(storage.getKeys());
  //   print(storage.read('8kytk2rQuMhg7xtv1yrza7k3zSI2'));
  //   // storage.erase();
  // }

  void addActivity() async {
    debugPrint('HomeController - addNewActivity is called');
    final icons = getIcons();
    final priorities = getPriorities();
    if (formKey.currentState!.validate()) {
      int icon = icons[iconIndex.value].icon!.codePoint;
      String priority = priorities[priorityIndex.value].toHex();
      String color = icons[iconIndex.value].color!.toHex();
      final now = DateTime.now();
      var item = Activity(title: editCtrl.text, icon: icon, color: color, priority: priority, tasks: const [], createdAt: now.toString());
      bool titleExists = activities.any((activity) => activity.title == item.title);
      bool iconExists = activities.any((activity) => activity.icon == item.icon);

      // print(item);
      // print('END  new ACTIVITY_______');

      Get.back();
      if (titleExists && iconExists) {
        EasyLoading.showError('error_activity_exist'.tr);
      } else {
        // await dbFirestore.setActivity(item.toJson(), authCtrl.authService.user()!.uid).then((docID) {
        activities.add(item);
        activities.length == 1 ? null : EasyLoading.showSuccess('${item.title} ' + 'created'.tr);
        // print(activities);
        // print('END ACTIVITY_______');
        //TODO: Turn this back on before you release
        // settingCtrl.nService.taskReminder(DateTime(now.year, now.month, now.day, now.hour, now.minute + 1));
      }
    }
  }

  void addTaskValidate(_) {
    debugPrint('HomeController - addTaskValidate is called');
    if (formKey.currentState!.validate()) {
      var success = addTask(editCtrl.text);
      success ? EasyLoading.showSuccess('added'.tr) : EasyLoading.showError('error_exist'.tr);
      editCtrl.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

// TODO: Make this as tutorial
  void showOverlay(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
        left: Get.width * 0.1,
        top: Get.height * 0.3,
        child: SizedBox(
          width: Get.width * 0.5,
          child: Stack(
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(60),
                child: Image.asset(commentDialog, colorBlendMode: BlendMode.multiply),
              ),
              Positioned(
                top: Get.height * 0.13,
                left: Get.width * 0.13,
                child: Material(
                  color: Colors.transparent,
                  child: Text('Create a task first', style: Theme.of(context).textTheme.headline6),
                ),
              ),
            ],
          ),
        ),
      );
    });

    overlayState!.insert(overlayEntry);

    await Future.delayed(const Duration(seconds: 2));

    overlayEntry.remove();
  }
}
