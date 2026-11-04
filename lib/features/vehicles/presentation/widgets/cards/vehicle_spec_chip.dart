import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';

/// Puce atomique affichant une spécification technique du véhicule (vitesse, places, carburant...).
class VehicleSpecChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isHighlighted;

  const VehicleSpecChip({
    super.key,
    required this.icon,
    required this.label,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.surfaceDim,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16.sp,
            color: isHighlighted ? AppColors.secondary : AppColors.onSurface,
          ),
          4.verticalSpace,
          Text(
            label,
            style: AppTypography.labelSm.copyWith(
              color: isHighlighted ? AppColors.onSurface : AppColors.onSurfaceVariant,
              fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w500,
              fontSize: 10.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
