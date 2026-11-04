import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobileautoloc/core/theme/app_colors.dart';
import 'package:mobileautoloc/core/theme/app_typography.dart';

/// Barre de navigation inférieure flottante style conciergerie VIP AutoLoc.
class VipFloatingBottomNav extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onTabSelected;

  const VipFloatingBottomNav({
    super.key,
    required this.activeIndex,
    required this.onTabSelected,
  });

  static const List<_NavItem> _items = [
    _NavItem(title: 'Explorer', icon: Icons.directions_car_rounded),
    _NavItem(title: 'Inspect', icon: Icons.verified_user_rounded),
    _NavItem(title: 'Livraison', icon: Icons.fmd_good_rounded),
    _NavItem(title: 'Contrat', icon: Icons.history_edu_rounded),
    _NavItem(title: 'Location', icon: Icons.speed_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
      height: 64.h,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.35),
            blurRadius: 24.r,
            offset: Offset(0, 10.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_items.length, (index) {
          final item = _items[index];
          final isActive = activeIndex == index;
          return _buildTabButton(
            item: item,
            isActive: isActive,
            onTap: () => onTabSelected(index),
          );
        }),
      ),
    );
  }

  Widget _buildTabButton({
    required _NavItem item,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 56.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              size: 22.sp,
              color: isActive ? AppColors.secondaryContainer : AppColors.onPrimaryContainer,
            ),
            3.verticalSpace,
            Text(
              item.title,
              style: AppTypography.labelSm.copyWith(
                color: isActive ? AppColors.secondaryContainer : AppColors.onPrimaryContainer,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                fontSize: 10.sp,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final String title;
  final IconData icon;

  const _NavItem({
    required this.title,
    required this.icon,
  });
}
