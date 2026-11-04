import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Badge supérieur indiquant le statut actif de la flotte de prestige en Tunisie.
class SplashFleetBadge extends StatelessWidget {
  const SplashFleetBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(999.r),
        border: Border.all(
          color: AppColors.secondary.withValues(alpha: 0.3),
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
          ),
          8.horizontalSpace,
          Text(
            'TUN FLEET ACTIVE • TIER 1 SOVEREIGN',
            style: AppTypography.labelSm.copyWith(
              fontSize: 10.sp,
              color: AppColors.secondary,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
