import 'package:va_tf_todo/data/models/activity.dart';
import 'package:va_tf_todo/data/providers/activity_provider.dart';

class ActivityRepository {
  ActivityProvider activityProvider;
  ActivityRepository({required this.activityProvider});
  List<Activity> readActivities() => activityProvider.readActivities();
  void writeActivities(List<Activity> activities) => activityProvider.writeActivities(activities);
  void deleteActivities() => activityProvider.deleteSavedActivities();
  void deleteAll() => activityProvider.deleteAll();
}
