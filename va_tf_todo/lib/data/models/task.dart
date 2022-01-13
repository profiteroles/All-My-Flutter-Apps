import 'dart:convert';

import 'package:equatable/equatable.dart';

class Task extends Equatable {
  String title;
  bool isdone;
  String createdAt;
  String? alarmAt;

  Task({
    required this.title,
    required this.isdone,
    required this.createdAt,
    this.alarmAt,
  });

  Task copyWith({String? title, bool? isdone, String? createdAt, String? alarmAt}) {
    return Task(
      title: title ?? this.title,
      isdone: isdone ?? this.isdone,
      createdAt: createdAt ?? this.createdAt,
      alarmAt: alarmAt ?? this.alarmAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'isdone': isdone});
    result.addAll({'created_at': createdAt});
    result.addAll({'alarm_at': alarmAt});

    return result;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      isdone: map['isdone'] ?? false,
      createdAt: map['created_at'] ?? '',
      alarmAt: map['alarm_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(title: $title, isdone: $isdone, created_at: $createdAt, alarm_at: $alarmAt)';
  }

  @override
  List<Object?> get props => [title, isdone, createdAt, alarmAt];
}
