import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';
import 'package:mobileautoloc/core/widgets/vip_checkbox.dart';
import 'package:mobileautoloc/core/widgets/vip_gold_button.dart';

/// Carte de recherche et réservation de conciergerie AutoLoc.
class ConciergeBookingCard extends StatelessWidget {
  final String pickupLocation;
  final bool returnSameLocation;
  final String startDate;
  final String endDate;
  final int rentalDays;
  final String selectedBranch;
  final VoidCallback onToggleReturnSameLocation;
  final ValueChanged<String> onSelectBranch;
  final VoidCallback? onSearchPressed;

  const ConciergeBookingCard({
    super.key,
    required this.pickupLocation,
    required this.returnSameLocation,
    required this.startDate,
    required this.endDate,
    required this.rentalDays,
    required this.selectedBranch,
    required this.onToggleReturnSameLocation,
    required this.onSelectBranch,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.06),
            blurRadius: 24.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête : Badge Dispatch & Terminal P2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 8.w,
                      height: 8.w,
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryContainer,
                        shape: BoxShape.circle,
                      ),
                    ),
                    6.horizontalSpace,
                    Flexible(
                      child: Text(
                        'CONCIERGERIE EXPRESS VIP',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.secondary,
                          letterSpacing: 0.6,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.surfaceDim,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  'Terminal P2 Fast-Track',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
          14.verticalSpace,

          // Champ Lieu de Prise en Charge
          _buildInfoTile(
            icon: Icons.flight_takeoff_rounded,
            caption: 'LIEU DE PRISE EN CHARGE',
            value: pickupLocation,
            trailing: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.onSurfaceVariant,
              size: 20.sp,
            ),
          ),
          10.verticalSpace,

          // Toggle Retour au même lieu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: VipCheckbox(
                  value: returnSameLocation,
                  onChanged: (_) => onToggleReturnSameLocation(),
                  label: 'Retour au même emplacement',
                ),
              ),
              Text(
                '0 DT Frais Restitution',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w700,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
          10.verticalSpace,

          // Champ Période de Location
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.surfaceDim,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: const BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.calendar_today_rounded,
                    size: 18.sp,
                    color: AppColors.primary,
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PÉRIODE DE LOCATION',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 10.sp,
                          letterSpacing: 0.5,
                        ),
                      ),
                      2.verticalSpace,
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              startDate,
                              style: AppTypography.labelMd.copyWith(
                                color: AppColors.onSurface,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          4.horizontalSpace,
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 14.sp,
                            color: AppColors.onSurfaceVariant,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              endDate,
                              style: AppTypography.labelMd.copyWith(
                                color: AppColors.onSurface,
                                fontWeight: FontWeight.w700,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    '$rentalDays Jours',
                    style: AppTypography.labelSm.copyWith(
                      color: AppColors.onPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          12.verticalSpace,

          // Sélecteur d'Agence (Segmented Buttons)
          Text(
            'AGENCE DE DÉPART',
            style: AppTypography.labelSm.copyWith(
              color: AppColors.onSurfaceVariant,
              fontSize: 10.sp,
              letterSpacing: 0.5,
            ),
          ),
          6.verticalSpace,
          Container(
            padding: EdgeInsets.all(4.w),
            decoration: BoxDecoration(
              color: AppColors.surfaceDim,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                _buildBranchOption(
                  title: 'Aéroport VIP P2',
                  icon: Icons.verified_rounded,
                  isSelected: selectedBranch == 'Airport VIP P2',
                  onTap: () => onSelectBranch('Airport VIP P2'),
                ),
                4.horizontalSpace,
                _buildBranchOption(
                  title: 'Berges du Lac 2',
                  icon: Icons.domain_rounded,
                  isSelected: selectedBranch == 'Berges du Lac 2',
                  onTap: () => onSelectBranch('Berges du Lac 2'),
                ),
              ],
            ),
          ),
          14.verticalSpace,

          // Bouton Principal CTA
          VipGoldButton(
            text: 'Rechercher un véhicule VIP',
            onPressed: onSearchPressed ?? () {},
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String caption,
    required String value,
    Widget? trailing,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.surfaceDim,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: const BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 18.sp, color: AppColors.primary),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  caption,
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 10.sp,
                    letterSpacing: 0.5,
                  ),
                ),
                2.verticalSpace,
                Text(
                  value,
                  style: AppTypography.labelMd.copyWith(
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildBranchOption({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.surface : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.06),
                    blurRadius: 4.r,
                    offset: Offset(0, 2.h),
                  ),
                ]
              : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 15.sp,
                color: isSelected ? AppColors.secondary : AppColors.onSurfaceVariant,
              ),
              6.horizontalSpace,
              Flexible(
                child: Text(
                  title,
                  style: AppTypography.labelMd.copyWith(
                    color: isSelected ? AppColors.onSurface : AppColors.onSurfaceVariant,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
