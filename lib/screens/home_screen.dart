import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            "Hello, Payal!",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Book your next salon appointment in Nagpur",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 24),

          // Quick action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildQuickAction(
                icon: Icons.calendar_today,
                label: "Book Now",
                color: const Color(0xFF3B82F6),
                onTap: () {

                },
              ),
              _buildQuickAction(
                icon: Icons.history,
                label: "Recent",
                color: const Color(0xFF8B5CF6),
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 32),
          Text(
            "Popular Services",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),

          SizedBox(
            height: 140,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                _PopularServiceCard(title: "Haircut & Style", duration: "45 min", price: "₹450", color: Colors.amber),
                SizedBox(width: 16),
                _PopularServiceCard(title: "Full Grooming", duration: "90 min", price: "₹999", color: Colors.teal),
                SizedBox(width: 16),
                _PopularServiceCard(title: "Hair Color", duration: "60 min", price: "₹799", color: Colors.deepPurple),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: color.withOpacity(0.12),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _PopularServiceCard extends StatelessWidget {
  final String title;
  final String duration;
  final String price;
  final Color color;

  const _PopularServiceCard({
    required this.title,
    required this.duration,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 36, backgroundColor: color.withOpacity(0.2), child: Icon(Icons.cut, color: color, size: 36)),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text("$duration • $price", style: TextStyle(color: Colors.grey[700], fontSize: 13)),
        ],
      ),
    );
  }
}