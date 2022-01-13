// import 'package:equatable/equatable.dart';

// class Activity extends Equatable {
//   String? id;
//   String title;
//   bool complete;
//   String color;
//   String priority;
//   int icon;
//   String createdAt;
//   List<dynamic>? tasks;

//   Activity({
//     this.id,
//     required this.title,
//     required this.icon,
//     required this.color,
//     required this.priority,
//     required this.createdAt,
//     this.complete = false,
//     this.tasks,
//   });

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'title': title,
//         'complete': complete,
//         'icon': icon,
//         'color': color,
//         'priority': priority,
//         'tasks': tasks,
//         'created_at': createdAt,
//       };

//   Activity copyWith({
//     String? id,
//     String? title,
//     int? icon,
//     String? color,
//     String? priority,
//     List<dynamic>? tasks,
//     bool? complete,
//     String? createdAt,
//   }) =>
//       Activity(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         icon: icon ?? this.icon,
//         color: color ?? this.color,
//         priority: priority ?? this.priority,
//         tasks: tasks ?? this.tasks,
//         complete: complete ?? this.complete,
//         createdAt: createdAt ?? this.createdAt,
//       );

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};
//     result.addAll({'id': id});
//     result.addAll({'title': title});
//     result.addAll({'icon': icon});
//     result.addAll({'color': color});
//     result.addAll({'priority': priority});
//     result.addAll({'complete': complete});
//     result.addAll({'created_at': createdAt});
//     result.addAll({'tasks': tasks ?? []});

//     return result;
//   }

//   factory Activity.fromJson(Map<String, dynamic> json) => Activity(
//         id: json['id'],
//         title: json['title'],
//         icon: json['icon'],
//         color: json['color'],
//         priority: json['priority'],
//         complete: json['complete'],
//         tasks: json['tasks'],
//         createdAt: json['created_at'],
//       );

//   @override
//   List<Object?> get props => [id, title, icon, color, priority, complete, tasks, createdAt];
// }
