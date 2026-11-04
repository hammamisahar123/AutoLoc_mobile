import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Bannière supérieure de prestige avec sélecteur de langue, badge VIP et statut Lounge.
class LoginHeaderBanner extends StatefulWidget {
  const LoginHeaderBanner({super.key});

  @override
  State<LoginHeaderBanner> createState() => _LoginHeaderBannerState();
}

class _LoginHeaderBannerState extends State<LoginHeaderBanner> {
  String _selectedLanguage = 'FR';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary,
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
              // 1. Barre d'utilité haute (Marque + Sélecteur de langue + Badge VIP)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Marque Concierge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.stars,
                          color: AppColors.secondary,
                          size: 16.sp,
                        ),
                        6.horizontalSpace,
                        Text(
                          'AUTOLOC CONCIERGE',
                          style: AppTypography.labelSm.copyWith(
                            color: Colors.white,
                            fontSize: 10.sp,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Sélecteur de langue + Badge VIP
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.r),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(999.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: ['FR', 'EN', 'عربي'].map((lang) {
                            final isSelected = _selectedLanguage == lang;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedLanguage = lang;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.secondary
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(999.r),
                                ),
                                child: Text(
                                  lang,
                                  style: AppTypography.labelSm.copyWith(
                                    color: isSelected
                                        ? const Color(0xFF251A00)
                                        : Colors.white.withValues(alpha: 0.75),
                                    fontWeight: isSelected
                                        ? FontWeight.w800
                                        : FontWeight.w500,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      8.horizontalSpace,
                      Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.verified_user,
                          color: const Color(0xFF251A00),
                          size: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.verticalSpace,

              // 2. Badge du salon VIP Tunis-Carthage
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    6.horizontalSpace,
                    Text(
                      'TUNIS-CARTHAGE VIP LOUNGE',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.secondary,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              8.verticalSpace,

              // 3. Titre d'accueil chaleureux
              Text(
                'Bon retour parmi nous',
                style: AppTypography.headlineXl.copyWith(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
