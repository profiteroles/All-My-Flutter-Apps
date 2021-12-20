// import 'dart:convert';

// class Mission {
//   final bool isDone;
//   final bool onFocus;
//   final String title;

//   Mission({
//     this.isDone = false,
//     this.onFocus = false,
//     required this.title,
//   });

//   Mission copyWith({
//     bool? isDone,
//     bool? onFocus,
//     String? title,
//   }) {
//     return Mission(
//       isDone: isDone ?? this.isDone,
//       onFocus: onFocus ?? this.onFocus,
//       title: title ?? this.title,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'isDone': isDone});
//     result.addAll({'onFocus': onFocus});
//     result.addAll({'title': title});

//     return result;
//   }

//   factory Mission.fromMap(Map<String, dynamic> map) {
//     return Mission(
//       isDone: map['isDone'] ?? false,
//       onFocus: map['onFocus'] ?? false,
//       title: map['title'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Mission.fromJson(String source) => Mission.fromMap(json.decode(source));

//   @override
//   String toString() => 'Mission(isDone: $isDone, onFocus: $onFocus, title: $title)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Mission && other.isDone == isDone && other.onFocus == onFocus && other.title == title;
//   }

//   @override
//   int get hashCode => isDone.hashCode ^ onFocus.hashCode ^ title.hashCode;
// }
