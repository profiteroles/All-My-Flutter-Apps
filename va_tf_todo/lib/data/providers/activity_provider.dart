import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:va_tf_todo/data/models/activity.dart';
import 'package:va_tf_todo/screens/auth/controller.dart';

class ActivityProvider {
  final _storage = GetStorage();
  final _auth = AuthController.instance;

  List<Activity> readActivities() {
    debugPrint('ActivityProvider - readActivities is Called');
    final key = _auth.authService.user()?.uid ?? '';
    var activities = <Activity>[];
    if (_storage.read(key) != null) {
      for (var activity in _storage.read(key) as List) {
        activities.add(Activity.fromJson(activity));
      }
      return activities;
    }
    return activities;
  }

  void writeActivities(List<Activity> activities) {
    debugPrint('ActivityProvider - writeActivities is Called');
    _storage.write(_auth.authService.user()!.uid, activities);
  }

  void deleteSavedActivities() {
    debugPrint('ActivityProvider - deleteSavedActivities is Called');
    _storage.remove(_auth.authService.user()!.uid);
  }

  void deleteAll() => _storage.erase();
}
