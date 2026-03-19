import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/booking_provider.dart';
import '../utils/time_utils.dart';

class BookingSummaryScreen extends StatelessWidget {
  final DateTime startTime;
  final int counterId;

  const BookingSummaryScreen({
    super.key,
    required this.startTime,
    required this.counterId,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingProvider>(context, listen: false);
    final endTime = startTime.add(Duration(minutes: provider.totalDuration));

    return Scaffold(
      appBar: AppBar(title: const Text('Booking Summary')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Services', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...provider.selectedServices.map(
                  (s) => ListTile(
                dense: true,
                title: Text(s.name),
                trailing: Text('\$${s.price} • ${s.durationInMinutes} min'),
              ),
            ),
            const Divider(height: 32),
            ListTile(
              title: const Text('Date & Time'),
              subtitle: Text(
                '${TimeUtils.formatTime(startTime)} – ${TimeUtils.formatTime(endTime)}',
              ),
            ),
            ListTile(
              title: const Text('Counter'),
              subtitle: Text('Counter #$counterId'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Booking confirmed! (demo)')),
                  );
                  // In real app → save booking + clear selection + navigate home
                },
                child: const Text('Confirm Booking', style: TextStyle(fontSize: 17)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}