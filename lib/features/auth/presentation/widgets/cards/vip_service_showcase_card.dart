import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/widgets/vip_svg_icon.dart';

/// Carte showcase de conciergerie Carthage et conformité légale tunisienne (< 90 lignes).
class VipServiceShowcaseCard extends StatelessWidget {
  const VipServiceShowcaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Carte prestige Meet & Greet Tunis-Carthage
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.primary,
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
                  Expanded(
                    child: Row(
                      children: [
                        const VipSvgIcon('plane_arrival', size: 18, color: Color(0xFFFEC325)),
                        6.horizontalSpace,
                        Flexible(
                          child: Text(
                            'SERVICE MEET & GREET CARTHAGE',
                            style: AppTypography.labelSm.copyWith(
                              color: const Color(0xFFFEC325),
                              fontWeight: FontWeight.w800,
                              fontSize: 10.sp,
                              letterSpacing: 0.8,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  8.horizontalSpace,
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
                    child: const Center(
                      child: VipSvgIcon('car_luxury', size: 28, color: AppColors.secondary),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Berlines Allemandes avec Chauffeur Privé',
                          style: AppTypography.labelMd.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 12.sp,
                          ),
                        ),
                        2.verticalSpace,
                        Text(
                          'Prise en charge directe au salon d\'honneur Carthage',
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

        // 2. Conformité Monétique Tunisie (ClicToPay) & Loi INPDP 2004-63
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VipSvgIcon('carthage_shield', size: 14, color: AppColors.secondary),
            6.horizontalSpace,
            Flexible(
              child: Text(
                'Paiements 100% sécurisés ClicToPay • GIE Monétique Tunisie',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontWeight: FontWeight.w700,
                  fontSize: 10.sp,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        4.verticalSpace,
        Text(
          'Protection des données personnelles certifiée conforme Loi Tunisienne N° 2004-63 (INPDP)',
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
