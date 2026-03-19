import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future Scope: I can cinnect it with backend
    final mockBookings = [
      {'service': 'Haircut & Style + Beard Trim', 'date': 'Tomorrow, 22 Mar', 'time': '11:30 AM – 12:35 PM', 'status': 'Confirmed'},
      {'service': 'Quick Trim', 'date': '15 Mar 2026', 'time': '4:00 PM – 4:15 PM', 'status': 'Completed'},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text("Your Bookings", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ...mockBookings.map((b) {
          final isUpcoming = b['status'] == 'Confirmed';
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isUpcoming ? Colors.green[100] : Colors.grey[300],
                child: Icon(isUpcoming ? Icons.event_available : Icons.history, color: isUpcoming ? Colors.green[700] : Colors.grey[700]),
              ),
              title: Text(b['service']!, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text("${b['date']} • ${b['time']} • ${b['status']}"),
              trailing: isUpcoming
                  ? TextButton(onPressed: () {}, child: const Text("Cancel", style: TextStyle(color: Colors.red)))
                  : null,
            ),
          );
        }).toList(),
        if (mockBookings.isEmpty)
          const Center(child: Padding(padding: EdgeInsets.all(40), child: Text("No bookings yet", style: TextStyle(fontSize: 18)))),
      ],
    );
  }
}