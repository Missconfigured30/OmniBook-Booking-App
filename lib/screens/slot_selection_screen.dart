import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/booking_provider.dart';
import '../utils/time_utils.dart';
import 'booking_summary_screen.dart';

class SlotSelectionScreen extends StatelessWidget {
  const SlotSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, provider, _) {
        final slots = TimeUtils.generatePossibleStarts(30);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Available Slots'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Text(
                    '${provider.totalDuration} min selected',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          body: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: slots.length,
            itemBuilder: (context, index) {
              final start = slots[index];
              final isAvailable = provider.isSlotAvailable(start);

              final freeCount = isAvailable ? provider.freeCountersAt(start) : 0;

              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                color: isAvailable ? null : Colors.grey[200],
                child: ListTile(
                  enabled: isAvailable,
                  title: Text(TimeUtils.formatTime(start)),
                  subtitle: isAvailable
                      ? Text('$freeCount ${freeCount == 1 ? "spot" : "spots"} left')
                      : const Text('Not available'),
                  trailing: isAvailable
                      ? const Icon(Icons.arrow_forward_ios, size: 18)
                      : null,
                  onTap: isAvailable
                      ? () {
                    final counter = provider.getAvailableCounterId(start);
                    if (counter != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookingSummaryScreen(
                            startTime: start,
                            counterId: counter,
                          ),
                        ),
                      );
                    }
                  }
                      : null,
                ),
              );
            },
          ),
        );
      },
    );
  }
}