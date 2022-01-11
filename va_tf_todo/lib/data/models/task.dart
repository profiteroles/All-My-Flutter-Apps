import 'package:equatable/equatable.dart';

class TasksList extends Equatable {
  String? id;
  String title;
  bool done;
  String color;
  String priority;
  int icon;
  String createdAt;
  List<dynamic>? tasks;

  TasksList({
    this.id,
    required this.title,
    required this.icon,
    required this.color,
    required this.priority,
    required this.createdAt,
    this.done = false,
    this.tasks,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'done': done,
        'icon': icon,
        'color': color,
        'priority': priority,
        'tasks': tasks,
        'created_at': createdAt,
      };

  TasksList copyWith({String? id, String? title, int? icon, String? color, String? priority, List<dynamic>? tasks, bool? done, String? createdAt}) => TasksList(
        id: id ?? this.id,
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        priority: priority ?? this.priority,
        tasks: tasks ?? this.tasks,
        done: done ?? this.done,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'icon': icon});
    result.addAll({'color': color});
    result.addAll({'priority': priority});
    result.addAll({'done': done});
    result.addAll({'created_at': createdAt});
    result.addAll({'tasks': tasks ?? []});

    return result;
  }

  factory TasksList.fromJson(Map<String, dynamic> json) => TasksList(
        id: json['id'],
        title: json['title'],
        icon: json['icon'],
        color: json['color'],
        priority: json['priority'],
        done: json['done'],
        tasks: json['tasks'],
        createdAt: json['created_at'],
      );

  @override
  List<Object?> get props => [id, title, icon, color, priority, done, tasks, createdAt];
}
