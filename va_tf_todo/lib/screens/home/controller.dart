import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/task_repository.dart';
import 'package:va_tf_todo/values/utils/extention.dart';
import 'package:va_tf_todo/widgets/icons.dart';

class HomeController extends GetxController {
  HomeController({required this.taskRepository});
  final TaskRepository taskRepository;

  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();

  final chipIndex = 0.obs;

  final deleting = false.obs;

  final task = Rx<Task?>(null);
  final tasks = <Task>[].obs;
  final doingTodos = <dynamic>[].obs;
  final doneTodos = <dynamic>[].obs;

  RxInt pageIndex = 1.obs;
  RxDouble fabOpacity = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint('HomeController - initialised');
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    debugPrint('HomeController - Closed');
    super.onClose();
    editCtrl.dispose();
  }

  void closeDialog() {
    Get.back();
    editCtrl.clear();
    changeTask(null);
  }

  void setPage(int index) {
    debugPrint('HomeController - setPage is Called Index is: $index');
    index == 1 ? fabOpacity(1) : fabOpacity(0);
    pageIndex(index);
  }

  void doneTodo(String title) {
    debugPrint('HomeController - doneTodo is Called title is: $title');
    var doingTodo = {'title': title, 'isDone': false};
    int index = doingTodos.indexWhere((e) => mapEquals<String, dynamic>(doingTodo, e));
    doingTodos.removeAt(index);
    var doneTodo = {'title': title, 'isDone': true};
    doneTodos.add(doneTodo);
    doingTodos.refresh();
    doneTodos.refresh();
  }

  void changeTodos(List<dynamic> select) {
    debugPrint('HomeController - changeTodos is Called');
    doingTodos.clear();
    doneTodos.clear();
    for (var i = 0; i < select.length; i++) {
      var todo = select[i];
      var status = todo['isDone'];
      if (status == true) {
        doneTodos.add(todo);
      } else {
        doingTodos.add(todo);
      }
    }
  }

  bool updateTask(Task task, String title) {
    debugPrint('HomeController - updateTask is called receive todo - title is: $title \n'
        '${task.title} ${task.icon} ${task.color}');
    var todos = task.todos ?? [];
    if (containerTodo(todos, title)) {
      return false;
    } else {
      var todo = {'title': title, 'isDone': false};
      todos.add(todo);
      var newTask = task.copyWith(todos: todos);
      int oldIdx = tasks.indexOf(task);
      tasks[oldIdx] = newTask;
      tasks.refresh();
      return true;
    }
  }

  bool containerTodo(List todos, String title) {
    debugPrint('HomeController - containerTodo is called receive todo - title is: $title \n$todos');
    return todos.any((todo) => todo['title'] == title);
  }

  void changeTask(Task? selected) {
    debugPrint('HomeController - changeTask is called receive value is:\n'
        '${selected?.title} ${selected?.icon} ${selected?.color}');
    task.value = selected;
  }

  void changeChipIndex(int i) {
    debugPrint('HomeController - changeChipIndex is called receive value is: $i');
    chipIndex.value = i;
  }

  void changeDeleting(bool value) {
    debugPrint('HomeController - changeDeleting is called receive value is: $value');
    deleting.value = value;
  }

  void deleteTask(Task task) {
    debugPrint('HomeController - addTask is called receive task is: \n'
        '${task.title} ${task.icon} ${task.color}');
    tasks.remove(task);
    EasyLoading.showSuccess('Task Removed');
  }

  bool addTask(Task task) {
    debugPrint('HomeController - addTask is called receive task is: \n'
        '${task.title} ${task.icon} ${task.color}');

    if (tasks.contains(task)) {
      return false;
    } else {
      tasks.add(task);
      return true;
    }
  }

  bool addTodo(String title) {
    debugPrint('HomeController - addTodo is called receive task is: $title');

    var todo = {'title': title, 'isDone': false};
    if (doingTodos.any((task) => mapEquals<String, dynamic>(todo, task))) {
      return false;
    }
    var doneTodo = {'title': title, 'isDone': true};
    if (doneTodos.any((task) => mapEquals<String, dynamic>(doneTodo, task))) {
      return false;
    }

    doingTodos.add(todo);
    return true;
  }

  void updateTodos() {
    debugPrint('HomeController - updateTodos is called');

    var newTodos = <Map<String, dynamic>>[];
    newTodos.addAll([...doingTodos, ...doneTodos]);
    var newTask = task.value!.copyWith(todos: newTodos);
    int oldIdx = tasks.indexOf(task.value);
    tasks[oldIdx] = newTask;
    tasks.refresh();
  }

  void deleteDoneTodo(dynamic task) {
    debugPrint('HomeController - deleteDoneTodo is called');
    doneTodos.remove(task);
  }

  bool isTodoEmpty(Task task) {
    debugPrint('HomeController - isTodoEmpty is called');
    return task.todos == null || task.todos!.isEmpty;
  }

  int getDoneTodo(Task task) {
    debugPrint('HomeController - getDoneTodo is called');
    var res = 0;
    for (var i = 0; i < task.todos!.length; i++) {
      if (task.todos![i]['isDone'] == true) {
        res += 1;
      }
    }
    return res;
  }

  void addNewList() {
    debugPrint('HomeController - addNewList is called');
    final icons = getIcons();
    if (formKey.currentState!.validate()) {
      int icon = icons[chipIndex.value].icon!.codePoint;
      String color = icons[chipIndex.value].color!.toHex();
      var task = Task(title: editCtrl.text, icon: icon, color: color);

      Get.back();
      addTask(task) ? EasyLoading.showSuccess('Create Success') : EasyLoading.showError('You already have that task!');
    }
  }

  void addMission() {
    debugPrint('HomeController - addMission is called');
    if (formKey.currentState!.validate()) {
      if (task.value == null) {
        EasyLoading.showError('Please Choose the list');
      } else {
        final bool success = updateTask(
          task.value!,
          editCtrl.text,
        );
        if (success) {
          EasyLoading.showSuccess('Task added to your ${task.value!.title}');
          closeDialog();
        } else {
          EasyLoading.showError('Task is already in the list');
        }
        editCtrl.clear();
      }
    }
  }

  void addForTaskScren() {
    if (formKey.currentState!.validate()) {
      var success = addTodo(editCtrl.text);
      if (success) {
        EasyLoading.showSuccess('New Task added to your List');
      } else {
        EasyLoading.showError('Task is already on the list');
      }
      editCtrl.clear();
    }
  }

  void toHomeScreen() {
    Get.back();
    updateTodos();
    editCtrl.clear();
    changeTask(null);
  }
}
