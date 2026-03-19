import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SizedBox(height: 16),
        Center(
          child: Column(
            children: [
              const CircleAvatar(radius: 60, backgroundColor: Color(0xFF3B82F6), child: Icon(Icons.person, size: 70, color: Colors.white)),
              const SizedBox(height: 16),
              const Text("Payal", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Text("Nagpur, Maharashtra", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              const SizedBox(height: 8),
              Text("Joined March 2025", style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const ListTile(leading: Icon(Icons.phone_android), title: Text("Phone Number"), subtitle: Text("+91 98XXXXXX45"), trailing: Icon(Icons.edit)),
        const ListTile(leading: Icon(Icons.email_outlined), title: Text("Email"), subtitle: Text("payal@example.com")),
        const Divider(height: 32),
        ListTile(leading: const Icon(Icons.bookmark_border), title: const Text("Saved Services"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
        ListTile(leading: const Icon(Icons.notifications_outlined), title: const Text("Notifications"), trailing: const Icon(Icons.chevron_right), onTap: () {}),
        const SizedBox(height: 24),
        OutlinedButton.icon(
          icon: const Icon(Icons.logout, color: Colors.red),
          label: const Text("Logout", style: TextStyle(color: Colors.red)),
          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red), minimumSize: const Size.fromHeight(52)),
          onPressed: () {},
        ),
      ],
    );
  }
}