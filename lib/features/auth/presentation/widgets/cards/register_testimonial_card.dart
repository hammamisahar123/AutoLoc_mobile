import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/widgets/vip_svg_icon.dart';

/// Bandeau de témoignage d'un membre VIP sur le tarmac de Tunis-Carthage.
class RegisterTestimonialCard extends StatelessWidget {
  const RegisterTestimonialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE9FF).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 38.w,
            height: 38.w,
            decoration: const BoxDecoration(
              color: AppColors.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: VipSvgIcon(
                'carthage_shield',
                size: 20,
                color: Color(0xFFFEC325),
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '“Clés remises directement sur le tarmac de Tunis-Carthage.”',
                  style: AppTypography.bodySm.copyWith(
                    color: AppColors.primaryContainer,
                    fontStyle: FontStyle.italic,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                2.verticalSpace,
                Text(
                  'S. Mansour — Membre Élite Tunis depuis 2023',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w800,
                    fontSize: 10.sp,
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
