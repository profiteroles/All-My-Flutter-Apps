import 'package:equatable/equatable.dart';

class TasksList extends Equatable {
  String? id;
  String title;
  bool done;
  String color;
  int icon;
  String createdAt;
  List<dynamic>? tasks;

  TasksList({
    this.id,
    required this.title,
    required this.icon,
    required this.color,
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
        'tasks': tasks,
        'created_at': createdAt,
      };

  // TasksList.fromDocumentSnapshot({required DocumentSnapshot doc}) {
  //   id = doc.id;
  //   title = doc['title'];
  //   icon = doc['icon'];
  //   color = doc['color'];
  // createdAt = doc['created_at'];
  //   tasks = doc['tasks'];
  // }

  TasksList copyWith({String? id, String? title, int? icon, String? color, List<dynamic>? tasks, bool? done, String? createdAt}) => TasksList(
        id: id ?? this.id,
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
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
    result.addAll({'done': done});
    result.addAll({'created_at': createdAt});
    result.addAll({'tasks': tasks ?? []});
    // if (tasks != null) {
    //   result.addAll({'tasks': tasks});
    // }

    return result;
  }

  factory TasksList.fromJson(Map<String, dynamic> json) => TasksList(
        id: json['id'],
        title: json['title'],
        icon: json['icon'],
        color: json['color'],
        done: json['done'],
        tasks: json['tasks'],
        createdAt: json['created_at'],
      );

  @override
  List<Object?> get props => [id, title, icon, color, done, tasks, createdAt];
}
