import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';
import 'package:mobileautoloc/features/vehicles/domain/entities/vehicle_entity.dart';
import 'vehicle_spec_chip.dart';

/// Carte de présentation d'un véhicule VIP dans le catalogue AutoLoc.
class VehicleCard extends StatelessWidget {
  final VehicleEntity vehicle;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onReservePressed;

  const VehicleCard({
    super.key,
    required this.vehicle,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onReservePressed,
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
            color: AppColors.primary.withValues(alpha: 0.05),
            blurRadius: 18.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ligne supérieure : Catégorie, Année et Bouton Favori
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          vehicle.category.toUpperCase(),
                          style: AppTypography.labelSm.copyWith(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                            fontSize: 10.sp,
                          ),
                        ),
                        8.horizontalSpace,
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceDim,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            vehicle.seriesTag,
                            style: AppTypography.labelSm.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    Text(
                      vehicle.fullName,
                      style: AppTypography.headlineSm.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onToggleFavorite,
                child: Container(
                  width: 36.w,
                  height: 36.w,
                  decoration: BoxDecoration(
                    color: isFavorite
                        ? AppColors.error.withValues(alpha: 0.1)
                        : AppColors.surfaceDim,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                    size: 20.sp,
                    color: isFavorite ? AppColors.error : AppColors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          12.verticalSpace,

          // Image du Véhicule avec badge flottant
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  height: 160.h,
                  width: double.infinity,
                  color: AppColors.surfaceDim,
                  child: Image.network(
                    vehicle.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Center(
                      child: Icon(
                        Icons.directions_car_rounded,
                        size: 64.sp,
                        color: AppColors.outline,
                      ),
                    ),
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Center(
                        child: SizedBox(
                          width: 24.w,
                          height: 24.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            value: progress.expectedTotalBytes != null
                                ? progress.cumulativeBytesLoaded /
                                    progress.expectedTotalBytes!
                                : null,
                            color: AppColors.secondary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 8.h,
                left: 8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.85),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.bolt_rounded,
                        size: 14.sp,
                        color: AppColors.secondaryContainer,
                      ),
                      4.horizontalSpace,
                      Text(
                        vehicle.floatingBadgeText,
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.onPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          12.verticalSpace,

          // Bande de spécifications techniques
          Row(
            children: [
              Expanded(
                child: VehicleSpecChip(
                  icon: Icons.settings_rounded,
                  label: vehicle.transmission,
                ),
              ),
              6.horizontalSpace,
              Expanded(
                child: VehicleSpecChip(
                  icon: Icons.airline_seat_recline_normal_rounded,
                  label: '${vehicle.seats} Places',
                ),
              ),
              6.horizontalSpace,
              Expanded(
                child: VehicleSpecChip(
                  icon: Icons.local_gas_station_rounded,
                  label: vehicle.fuelType,
                ),
              ),
              6.horizontalSpace,
              Expanded(
                child: VehicleSpecChip(
                  icon: Icons.all_inclusive_rounded,
                  label: vehicle.keyFeature,
                  isHighlighted: true,
                ),
              ),
            ],
          ),
          14.verticalSpace,

          // Pied de carte : Prix et CTA Réserver
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${vehicle.dailyPriceTnd.toStringAsFixed(0)} DT',
                        style: AppTypography.headlineSm.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.onSurface,
                        ),
                      ),
                      4.horizontalSpace,
                      Text(
                        '/ jour',
                        style: AppTypography.labelMd.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  2.verticalSpace,
                  Text(
                    '${vehicle.totalPriceTnd.toStringAsFixed(0)} DT (${vehicle.rentalDays} jours au total)',
                    style: AppTypography.labelSm.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onReservePressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryContainer,
                  foregroundColor: AppColors.onSecondaryContainer,
                  padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Réserver',
                      style: AppTypography.labelLg.copyWith(
                        color: AppColors.onSecondaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    4.horizontalSpace,
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 16.sp,
                      color: AppColors.onSecondaryContainer,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
