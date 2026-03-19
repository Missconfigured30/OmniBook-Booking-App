class Booking {
  final int counterId;
  final DateTime startTime;
  final DateTime endTime;

  Booking({
    required this.counterId,
    required this.startTime,
    required this.endTime,
  });

  bool overlapsWith(DateTime proposedStart, DateTime proposedEnd) {
    return proposedStart.isBefore(endTime) && proposedEnd.isAfter(startTime);
  }
}