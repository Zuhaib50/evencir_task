import 'package:flutter/material.dart';

import '../../../../core/extensions/num_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_card.dart';

class WeightCard extends StatelessWidget {
  const WeightCard({
    super.key,
    required this.weight,
    required this.unit,
    required this.delta,
  });

  final int weight;
  final String unit;
  final String delta;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(18.sp(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$weight',
                  style: TextStyle(
                    fontSize: 38.sp(context),
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    height: 1,
                  ),
                ),
                4.sp(context).horizontalSpace,
                Padding(
                  padding: EdgeInsets.only(bottom: 4.sp(context)),
                  child: Text(
                    unit,
                    style: TextStyle(
                      fontSize: 14.sp(context),
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          12.sp(context).verticalSpace,
          Row(
            children: [
              Container(
                width: 22.sp(context),
                height: 22.sp(context),
                decoration: BoxDecoration(
                  color: AppColors.green.withValues(alpha: 0.4),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_outward_rounded,
                  size: 14.sp(context),
                  color: AppColors.green,
                ),
              ),
              8.sp(context).horizontalSpace,
              Text(
                delta,
                style: TextStyle(
                  fontSize: 12.sp(context),
                  fontWeight: FontWeight.w600,
                  color: AppColors.green,
                ),
              ),
            ],
          ),
          28.sp(context).verticalSpace,
          Text(
            'Weight',
            style: TextStyle(
              fontSize: 18.sp(context),
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
