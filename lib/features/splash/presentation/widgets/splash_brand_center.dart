import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Bloc central officiel AutoLoc : Blason doré animé, typographie de prestige et badge aéroportuaire.
class SplashBrandCenter extends StatelessWidget {
  const SplashBrandCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.scale(
            scale: 0.85 + (0.15 * value),
            child: child,
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Blason officiel AutoLoc
          Container(
            width: 125.w,
            height: 125.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.secondary.withValues(alpha: 0.3),
                  blurRadius: 35.r,
                  spreadRadius: 4.r,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/icons/app_icon.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          24.verticalSpace,

          // Titre principal
          Text(
            'AUTOLOC',
            style: AppTypography.headlineXl.copyWith(
              fontSize: 32.sp,
              color: Colors.white,
              letterSpacing: 7.w,
              fontWeight: FontWeight.w900,
            ),
          ),
          4.verticalSpace,

          // Sous-titre avec séparateurs dorés
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 1.h,
                color: AppColors.secondary.withValues(alpha: 0.6),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  'CONCIERGE MOBILITY',
                  style: AppTypography.labelMd.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.secondary,
                    letterSpacing: 3.5.w,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                width: 24.w,
                height: 1.h,
                color: AppColors.secondary.withValues(alpha: 0.6),
              ),
            ],
          ),
          16.verticalSpace,

          // Badge aéroport VIP Carthage
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer.withValues(alpha: 0.85),
              borderRadius: BorderRadius.circular(999.r),
            ),
            child: Text(
              'VIP Airport Delivery • Tunis-Carthage',
              style: AppTypography.labelSm.copyWith(
                fontSize: 11.sp,
                color: AppColors.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
