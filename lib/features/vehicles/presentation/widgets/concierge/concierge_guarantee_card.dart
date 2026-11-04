import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';
import 'package:mobileautoloc/core/widgets/vip_svg_icon.dart';

/// Bannière de réassurance exclusive "Garantie Conciergerie VIP - AutoLoc DADA".
class ConciergeGuaranteeCard extends StatelessWidget {
  const ConciergeGuaranteeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.15),
            blurRadius: 16.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icône bouclier VIP / Couronne dorée
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const VipSvgIcon(
              'carthage_shield',
              size: 20,
              color: AppColors.secondaryContainer,
            ),
          ),
          12.horizontalSpace,

          // Textes de garantie VIP
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'GARANTIE CONCIERGERIE',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.secondaryContainer,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.6,
                          fontSize: 10.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    4.horizontalSpace,
                    Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryContainer,
                        shape: BoxShape.circle,
                      ),
                    ),
                    4.horizontalSpace,
                    Text(
                      'AutoLoc DADA',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                4.verticalSpace,
                Text(
                  'Zéro caution bloquée, remise des clés sur le tarmac de Tunis-Carthage et assistance routière VIP 24/7 incluse.',
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.onPrimaryContainer.withValues(alpha: 0.9),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
