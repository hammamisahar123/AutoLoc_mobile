import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Carte showcase de conciergerie Carthage et conformité légale (< 90 lignes).
class VipServiceShowcaseCard extends StatelessWidget {
  const VipServiceShowcaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Carte prestige Meet & Greet
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 10.r,
                offset: Offset(0, 4.h),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flight_land_rounded, color: const Color(0xFFFEC325), size: 18.sp),
                      6.horizontalSpace,
                      Text(
                        'SERVICE MEET & GREET CARTHAGE',
                        style: AppTypography.labelSm.copyWith(
                          color: const Color(0xFFFEC325),
                          fontWeight: FontWeight.w800,
                          fontSize: 10.sp,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '24/7 Disponible',
                    style: AppTypography.labelSm.copyWith(
                      color: const Color(0xFFD3E4FE),
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              12.verticalSpace,
              Row(
                children: [
                  Container(
                    width: 56.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(Icons.directions_car_filled_rounded, color: AppColors.secondary, size: 26.sp),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Berlines avec Chauffeur Privé',
                          style: AppTypography.labelMd.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 12.sp,
                          ),
                        ),
                        2.verticalSpace,
                        Text(
                          'Prise en charge directe au salon d\'honneur',
                          style: AppTypography.bodySm.copyWith(
                            color: const Color(0xFFBAC7E1),
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        16.verticalSpace,

        // 2. Conformité Monétique Tunisie & Loi 2000-83
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified_user_rounded, color: AppColors.secondary, size: 14.sp),
            6.horizontalSpace,
            Text(
              'Paiements 100% sécurisés • Monétique Tunisie',
              style: AppTypography.labelSm.copyWith(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w700,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
        4.verticalSpace,
        Text(
          'Conforme aux normes de protection de données Loi Tunisienne N° 2000-83',
          textAlign: TextAlign.center,
          style: AppTypography.labelSm.copyWith(
            color: AppColors.outline.withValues(alpha: 0.8),
            fontSize: 9.sp,
          ),
        ),
      ],
    );
  }
}
