import 'package:equatable/equatable.dart';

import 'package:va_tf_todo/data/models/task.dart';

class Activity extends Equatable {
  String? id;
  String title;
  // bool complete;
  String color;
  String priority;
  int icon;
  String createdAt;
  List<Task>? tasks;

  Activity({
    this.id,
    required this.title,
    // required this.complete,
    required this.color,
    required this.priority,
    required this.icon,
    required this.createdAt,
    this.tasks,
  });

  Activity copyWith({
    String? id,
    String? title,
    // bool? complete,
    String? color,
    String? priority,
    int? icon,
    String? createdAt,
    List<Task>? tasks,
  }) {
    return Activity(
      id: id ?? this.id,
      title: title ?? this.title,
      // complete: complete ?? this.complete,
      color: color ?? this.color,
      priority: priority ?? this.priority,
      icon: icon ?? this.icon,
      createdAt: createdAt ?? this.createdAt,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        // 'complete': complete,
        'color': color,
        'priority': priority,
        'icon': icon,
        'created_at': createdAt,
        'tasks': tasks != null ? tasks!.map((x) => x.toMap()).toList() : [],
      };
  // Map<String, dynamic> toMap() {
  //   final result = <String, dynamic>{};

  //   result.addAll({'id': id});
  //   result.addAll({'title': title});
  //   result.addAll({'complete': complete});
  //   result.addAll({'color': color});
  //   result.addAll({'priority': priority});
  //   result.addAll({'icon': icon});
  //   result.addAll({'createdAt': createdAt});
  //   result.addAll({'tasks': tasks != null ? tasks!.map((x) => x.toMap()).toList() : []});

  //   return result;
  // }

  // String toJson() => json.encode(toMap());

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json['id'],
        title: json['title'] ?? '',
        // complete: json['complete'] ?? false,
        color: json['color'] ?? '',
        priority: json['priority'] ?? '',
        icon: json['icon']?.toInt() ?? 0,
        createdAt: json['created_at'],
        tasks: json['tasks'] != null ? List<Task>.from(json['tasks']?.map((x) => Task.fromMap(x))) : null,
      );

  @override
  String toString() {
    return 'Activity(id: $id, title: $title,  color: $color, priority: $priority, icon: $icon,createdAt: $createdAt,tasks: $tasks)';
  }

  @override
  List<Object?> get props => [id, title, color, priority, icon, createdAt, tasks];
}
