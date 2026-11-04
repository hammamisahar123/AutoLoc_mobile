import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// En-tête de prestige pour la création de compte VIP avec jauge d'étape (Step Bar).
class RegisterHeaderBanner extends StatelessWidget {
  const RegisterHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 15.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Monogramme AL + Badge Accès Privilège
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 38.w,
                        height: 38.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEC325),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 6.r,
                              offset: Offset(0, 2.h),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'AL',
                            style: AppTypography.headlineSm.copyWith(
                              color: const Color(0xFF251A00),
                              fontWeight: FontWeight.w900,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AUTOLOC EXCLUSIVE',
                            style: AppTypography.labelSm.copyWith(
                              color: const Color(0xFFFFDF9C),
                              fontSize: 9.sp,
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Concierge Club',
                            style: AppTypography.headlineSm.copyWith(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEC325).withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.workspace_premium_rounded,
                          color: const Color(0xFFFFDF9C),
                          size: 14.sp,
                        ),
                        4.horizontalSpace,
                        Text(
                          'ACCÈS PRIVILÈGE',
                          style: AppTypography.labelSm.copyWith(
                            color: const Color(0xFFFFDF9C),
                            fontWeight: FontWeight.w800,
                            fontSize: 9.sp,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              16.verticalSpace,

              // 2. Titre et description
              Text(
                'Créer un compte VIP',
                style: AppTypography.headlineXl.copyWith(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
              4.verticalSpace,
              Text(
                'Rejoignez le club AutoLoc pour une prise en charge immédiate sans attente aux comptoirs.',
                style: AppTypography.bodySm.copyWith(
                  color: const Color(0xFFBAC7E1),
                  fontSize: 12.sp,
                  height: 1.4,
                ),
              ),
              16.verticalSpace,

              // 3. Step Bar Tracker (Étape 1 sur 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 7.w,
                        height: 7.w,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFEC325),
                          shape: BoxShape.circle,
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        'Étape 1 sur 2 : Identité & Contact',
                        style: AppTypography.labelSm.copyWith(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '50% Complété',
                    style: AppTypography.labelSm.copyWith(
                      color: const Color(0xFFFFDF9C),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              Container(
                height: 4.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEC325),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
