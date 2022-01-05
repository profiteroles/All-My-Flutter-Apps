import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/providers/task_provider.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<TasksList> readTasks() => taskProvider.readTasks();

  void writeTasks(List<TasksList> tasks) => taskProvider.writeTasks(tasks);
}
