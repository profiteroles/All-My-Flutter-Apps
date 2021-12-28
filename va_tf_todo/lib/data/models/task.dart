import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Task extends Equatable {
  late String id;
  late bool isDone;
  late String title;
  late int icon;
  late String color;
  late Timestamp createdAt;
  late List<dynamic>? todos;

  Task({
    required this.title,
    required this.icon,
    required this.color,
    this.isDone = false,
    this.todos,
  });

  Task.fromDocumentSnapshot({required DocumentSnapshot doc}) {
    id = doc.id;
    title = doc['title'];
    icon = doc['icon'];
    color = doc['color'];
    createdAt = doc['created_at'];
    todos = doc['doc'];
  }

  Task copyWith({String? title, int? icon, String? color, List<dynamic>? todos}) => Task(
        title: title ?? this.title,
        icon: icon ?? this.icon,
        color: color ?? this.color,
        todos: todos ?? this.todos,
      );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'icon': icon});
    result.addAll({'color': color});
    if (todos != null) {
      result.addAll({'todos': todos});
    }

    return result;
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        title: json['title'],
        icon: json['icon'],
        color: json['color'],
        todos: json['todos'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'icon': icon,
        'color': color,
        'todos': todos,
      };

  @override
  List<Object?> get props => [title, icon, color];
}
