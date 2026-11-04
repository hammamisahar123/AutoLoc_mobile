import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';

/// En-tête de section présentant le titre de la flotte et le menu de tri.
class FleetInventoryHeader extends StatelessWidget {
  final int count;
  final String sortOption;
  final ValueChanged<String> onSortChanged;

  const FleetInventoryHeader({
    super.key,
    required this.count,
    required this.sortOption,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Flotte Disponible',
                  style: AppTypography.headlineSm.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                2.verticalSpace,
                Text(
                  'TUN Terminal 1 Prêt',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          8.horizontalSpace,
          PopupMenuButton<String>(
            initialValue: sortOption,
            onSelected: onSortChanged,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'Popularité',
                child: Text('Popularité'),
              ),
              const PopupMenuItem(
                value: 'Prix croissant',
                child: Text('Prix croissant'),
              ),
              const PopupMenuItem(
                value: 'Prix décroissant',
                child: Text('Prix décroissant'),
              ),
            ],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Trier : $sortOption',
                  style: AppTypography.labelMd.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.horizontalSpace,
                Icon(
                  Icons.tune_rounded,
                  size: 16.sp,
                  color: AppColors.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
