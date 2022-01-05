import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class TasksList extends Equatable {
  late String id;
  late bool isDone;
  late String title;
  late int icon;
  late String color;
  late Timestamp createdAt;
  late List<dynamic>? tasks;
  late int totalTasks;

  TasksList({
    required this.title,
    required this.icon,
    required this.color,
    this.isDone = false,
    this.totalTasks = 0,
    this.tasks,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'is_done': isDone,
        'icon': icon,
        'color': color,
        'tasks': tasks,
        'created_at': createdAt,
        'total_tasks': totalTasks,
      };

  TasksList.fromDocumentSnapshot({required DocumentSnapshot doc}) {
    id = doc.id;
    title = doc['title'];
    icon = doc['icon'];
    color = doc['color'];
    createdAt = doc['created_at'];
    tasks = doc['doc'];
  }

  TasksList copyWith({String? title, int? icon, String? color, List<dynamic>? tasks}) => TasksList(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        tasks: tasks ?? this.tasks,
      );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'icon': icon});
    result.addAll({'color': color});
    if (tasks != null) {
      result.addAll({'todos': tasks});
    }

    return result;
  }

  factory TasksList.fromJson(Map<String, dynamic> json) => TasksList(
        title: json['title'],
        icon: json['icon'],
        color: json['color'],
        tasks: json['tasks'],
      );

  @override
  List<Object?> get props => [title, icon, color];
}
