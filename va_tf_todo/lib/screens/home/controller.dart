import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/services/task_repository.dart';

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

  void doneTodo(String title) {
    var doingTodo = {'title': title, 'isDone': false};
    int index = doingTodos.indexWhere((e) => mapEquals<String, dynamic>(doingTodo, e));
    doingTodos.removeAt(index);
    var doneTodo = {'title': title, 'isDone': true};
    doneTodos.add(doneTodo);
    doingTodos.refresh();
    doneTodos.refresh();
  }

  void changeTodos(List<dynamic> select) {
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

  void closeDialog() {
    Get.back();
    editCtrl.clear();
    changeTask(null);
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
    print('HomeController - updateTask is called receive todo - title is: $title \n$todos');
    return todos.any((todo) => todo['title'] == title);
  }

  void changeTask(Task? selected) {
    print('HomeController - changeTask is called receive value is:\n'
        '${selected?.title} ${selected?.icon} ${selected?.color}');
    task.value = selected;
  }

  void changeChipIndex(int i) {
    print('HomeController - changeChipIndex is called receive value is: $i');

    chipIndex.value = i;
  }

  void changeDeleting(bool value) {
    print('HomeController - changeChipIndex is called receive value is: $value');
    deleting.value = value;
  }

  void deleteTask(Task task) {
    print('HomeController - addTask is called receive task is: \n'
        '${task.title} ${task.icon} ${task.color}');
    tasks.remove(task);
  }

  bool addTask(Task task) {
    print('HomeController - addTask is called receive task is: \n'
        '${task.title} ${task.icon} ${task.color}');

    if (tasks.contains(task)) {
      return false;
    } else {
      tasks.add(task);
      return true;
    }
  }

  bool addTodo(String title) {
    print('HomeController - addTodo is called receive task is: $title');

    var todo = {'title': title, 'isDone': false};
    if (doingTodos.any((task) => mapEquals<String, dynamic>(todo, task))) {
      return false;
    }
    var doneTodo = {'title': title, 'isDone': false};
    if (doneTodos.any((task) => mapEquals<String, dynamic>(doneTodo, task))) {
      return false;
    }

    doingTodos.add(todo);
    return true;
  }

  void updateTodos() {
    print('HomeController - updateTodos is called');

    var newTodos = <Map<String, dynamic>>[];
    newTodos.addAll([...doingTodos, ...doneTodos]);
    var newTask = task.value!.copyWith(todos: newTodos);
    int oldIdx = tasks.indexOf(task.value);
    tasks[oldIdx] = newTask;
    tasks.refresh();
  }

  void deleteDoneTodo(dynamic task) {
    print('HomeController - deleteDoneTodo is called');

    // var doneTodo = {'title': title, 'isDone': true};
    // int index = doneTodos().indexWhere((item) => mapEquals(task, item));
    //  doneTodos.removeAt(index);
    doneTodos.remove(task);
  }

  bool isTodoEmpty(Task task) {
    print('HomeController - isTodoEmpty is called');

    return task.todos == null || task.todos!.isEmpty;
  }

  int getDoneTodo(Task task) {
    print('HomeController - getDoneTodo is called');
    var res = 0;
    for (var i = 0; i < task.todos!.length; i++) {
      res += 1;
    }
    return res;
  }
}
