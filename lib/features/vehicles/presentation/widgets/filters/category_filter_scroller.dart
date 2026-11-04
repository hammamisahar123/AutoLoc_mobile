import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';

/// Défilement horizontal des filtres par catégorie de véhicule.
class CategoryFilterScroller extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onSelectCategory;

  const CategoryFilterScroller({
    super.key,
    required this.selectedCategory,
    required this.onSelectCategory,
  });

  static const List<_CategoryItem> _categories = [
    _CategoryItem(title: 'Tous les véhicules', count: 28, icon: Icons.apps_rounded),
    _CategoryItem(title: 'Citadine', count: 8, icon: Icons.directions_car_rounded),
    _CategoryItem(title: 'Berline', count: 7, icon: Icons.directions_car_filled_rounded),
    _CategoryItem(title: 'SUV & 4x4', count: 9, icon: Icons.electric_car_rounded),
    _CategoryItem(title: 'Luxury / VIP', count: 4, icon: Icons.diamond_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: _categories.map((cat) {
          final isSelected = selectedCategory == cat.title ||
              (selectedCategory == 'All Vehicles' && cat.title == 'Tous les véhicules');
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: _buildCategoryPill(cat, isSelected),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryPill(_CategoryItem item, bool isSelected) {
    return GestureDetector(
      onTap: () => onSelectCategory(item.title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondaryContainer : AppColors.surface,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: isSelected ? AppColors.secondaryContainer : AppColors.outline.withValues(alpha: 0.6),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.secondaryContainer.withValues(alpha: 0.3)
                  : AppColors.primary.withValues(alpha: 0.03),
              blurRadius: 6.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              Container(
                width: 6.w,
                height: 6.w,
                margin: EdgeInsets.only(right: 6.w),
                decoration: const BoxDecoration(
                  color: AppColors.onSecondaryContainer,
                  shape: BoxShape.circle,
                ),
              )
            else
              Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: Icon(
                  item.icon,
                  size: 16.sp,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            Text(
              item.title,
              style: AppTypography.labelMd.copyWith(
                color: isSelected ? AppColors.onSecondaryContainer : AppColors.onSurface,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
            4.horizontalSpace,
            Text(
              '(${item.count})',
              style: AppTypography.labelSm.copyWith(
                color: isSelected
                    ? AppColors.onSecondaryContainer.withValues(alpha: 0.8)
                    : AppColors.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryItem {
  final String title;
  final int count;
  final IconData icon;

  const _CategoryItem({
    required this.title,
    required this.count,
    required this.icon,
  });
}
