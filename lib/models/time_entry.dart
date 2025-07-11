class TimeEntry {
  final String id;
  final String taskId;
  final DateTime startTime;
  final DateTime endTime;

  TimeEntry({
    required this.id,
    required this.taskId,
    required this.startTime,
    required this.endTime,
  });
}
