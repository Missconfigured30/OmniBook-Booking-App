import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/booking_provider.dart';
import '../widgets/service_card.dart';

class ServiceSelectionScreen extends StatelessWidget {
  const ServiceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookingProvider>(context);
    final hasSelection = provider.selectedServices.isNotEmpty;

    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Text(
              "What service do you need today?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF64748B)),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final service = provider.allServices[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ServiceCard(
                    service: service,
                    isSelected: provider.isSelected(service),
                    onTap: () => provider.toggleService(service),
                  ),
                );
              },
              childCount: provider.allServices.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }
}