import 'package:flutter/material.dart';

import '../models/booking.dart';
import '../models/service.dart';
import '../utils/time_utils.dart';

class BookingProvider extends ChangeNotifier {
  // Services
  final List<Service> _allServices = [
    Service(name: 'Quick Trim', durationInMinutes: 15, price: 200),
    Service(name: 'Beard Trim', durationInMinutes: 20, price: 400),
    Service(name: 'Haircut & Style', durationInMinutes: 45, price: 400),
    Service(name: 'Full Grooming', durationInMinutes: 90, price: 1200),
    Service(name: 'Hair Color', durationInMinutes: 60, price: 1500),
    Service(name: 'Scalp Massage', durationInMinutes: 30, price: 350),
  ];

  List<Service> get allServices => _allServices;

  final Set<Service> _selectedServices = {};

  Set<Service> get selectedServices => _selectedServices;

  int get totalDuration {
    return _selectedServices.fold(0, (sum, s) => sum + s.durationInMinutes);
  }

  double get totalPrice {
    return _selectedServices.fold(0.0, (sum, s) => sum + s.price);
  }

  void toggleService(Service service) {
    if (_selectedServices.contains(service)) {
      _selectedServices.remove(service);
    } else {
      _selectedServices.add(service);
    }
    notifyListeners();
  }

  bool isSelected(Service service) => _selectedServices.contains(service);

  // Mock Data Given
  final List<Booking> _existingBookings = [
    Booking(
      counterId: 1,
      startTime: TimeUtils.todayAt(10, 0),
      endTime: TimeUtils.todayAt(11, 0),
    ),
    Booking(
      counterId: 2,
      startTime: TimeUtils.todayAt(10, 30),
      endTime: TimeUtils.todayAt(11, 30),
    ),
    Booking(
      counterId: 3,
      startTime: TimeUtils.todayAt(9, 0),
      endTime: TimeUtils.todayAt(10, 30),
    ),
  ];

  // Slot Logic
  bool isSlotAvailable(DateTime proposedStart) {
    if (totalDuration == 0) return false;

    final proposedEnd = proposedStart.add(Duration(minutes: totalDuration));

    if (!TimeUtils.isWithinBusinessHours(proposedStart, proposedEnd)) {
      return false;
    }

    const counters = [1, 2, 3];

    for (final counter in counters) {
      bool conflict = false;
      for (final booking in _existingBookings) {
        if (booking.counterId == counter &&
            booking.overlapsWith(proposedStart, proposedEnd)) {
          conflict = true;
          break;
        }
      }
      if (!conflict) {
        return true;
      }
    }
    return false;
  }

  int? getAvailableCounterId(DateTime start) {
    if (!isSlotAvailable(start)) return null;

    final end = start.add(Duration(minutes: totalDuration));
    const counters = [1, 2, 3];

    for (final counter in counters) {
      bool free = true;
      for (final b in _existingBookings) {
        if (b.counterId == counter && b.overlapsWith(start, end)) {
          free = false;
          break;
        }
      }
      if (free) return counter;
    }
    return null;
  }

  int freeCountersAt(DateTime start) {
    final end = start.add(Duration(minutes: totalDuration));
    int free = 0;
    for (int c = 1; c <= 3; c++) {
      bool occupied = _existingBookings.any(
            (b) => b.counterId == c && b.overlapsWith(start, end),
      );
      if (!occupied) free++;
    }
    return free;
  }
}