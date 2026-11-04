import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';
import 'package:mobileautoloc/core/widgets/vip_svg_icon.dart';

/// Barre d'en-tête supérieure pour la découverte des véhicules AutoLoc.
/// Présente le logo, le sélecteur d'aéroport Tunis-Carthage et les raccourcis profil.
class ExploreHeaderBar extends StatelessWidget {
  final VoidCallback? onLocationTap;
  final VoidCallback? onNotificationsTap;
  final VoidCallback? onProfileTap;

  const ExploreHeaderBar({
    super.key,
    this.onLocationTap,
    this.onNotificationsTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.95),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.04),
            blurRadius: 16.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Monogramme / Logo AutoLoc
            Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                color: AppColors.secondaryContainer,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondaryContainer.withValues(alpha: 0.3),
                    blurRadius: 8.r,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'AL',
                style: AppTypography.labelLg.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w900,
                  fontSize: 15.sp,
                ),
              ),
            ),
            10.horizontalSpace,

            // Sélecteur d'aéroport Tunis-Carthage
            Expanded(
              child: InkWell(
                onTap: onLocationTap,
                borderRadius: BorderRadius.circular(8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CONCIERGERIE AUTOLOC',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.secondary,
                        letterSpacing: 0.8,
                        fontWeight: FontWeight.w700,
                        fontSize: 10.sp,
                      ),
                    ),
                    2.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const VipSvgIcon(
                          'plane_arrival',
                          size: 14,
                          color: AppColors.secondary,
                        ),
                        4.horizontalSpace,
                        Flexible(
                          child: Text(
                            'Tunis-Carthage (TUN)',
                            style: AppTypography.labelLg.copyWith(
                              color: AppColors.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18.sp,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Bouton Notifications avec Badge
            Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  onPressed: onNotificationsTap,
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.onSurface,
                    size: 24.sp,
                  ),
                  splashRadius: 20.r,
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryContainer,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.surface,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Avatar Utilisateur VIP
            GestureDetector(
              onTap: onProfileTap,
              child: Container(
                width: 36.w,
                height: 36.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryContainer,
                  border: Border.all(
                    color: AppColors.secondaryContainer.withValues(alpha: 0.6),
                    width: 1.5,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'KB',
                  style: AppTypography.labelMd.copyWith(
                    color: AppColors.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
