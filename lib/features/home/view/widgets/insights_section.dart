import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import 'calories_card.dart';
import 'hydration_card.dart';
import 'weight_card.dart';

class InsightsSection extends StatelessWidget {
  const InsightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double gap = 14.sp(context);

    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: CaloriesCard(calories: 550, remaining: 1950, max: 2500),
              ),
              SizedBox(width: gap),
              const Expanded(
                child: WeightCard(weight: 75, unit: 'kg', delta: '+1.6kg'),
              ),
            ],
          ),
        ),
        SizedBox(height: gap),
        const HydrationCard(
          percent: 0,
          reading: '0ml',
          bannerText: '500 ml added to water log',
        ),
      ],
    );
  }
}
