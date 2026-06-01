import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';
import 'hydration_scale.dart';
import 'water_log_banner.dart';

class HydrationCard extends StatelessWidget {
  const HydrationCard({
    super.key,
    required this.percent,
    required this.reading,
    required this.bannerText,
  });

  final int percent;
  final String reading;
  final String bannerText;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(18.sp(context)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$percent%',
                        style: TextStyle(
                          fontSize: 36.sp(context),
                          fontWeight: FontWeight.w700,
                          color: AppColors.blue,
                          height: 1,
                        ),
                      ),
                      40.sp(context).verticalSpace,
                      Text(
                        'Hydration',
                        style: TextStyle(
                          fontSize: 18.sp(context),
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      4.sp(context).verticalSpace,
                      Text(
                        'Log Now',
                        style: TextStyle(
                          fontSize: 11.sp(context),
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: HydrationScale(reading: reading)),
              ],
            ),
          ),
          WaterLogBanner(text: bannerText),
        ],
      ),
    );
  }
}
