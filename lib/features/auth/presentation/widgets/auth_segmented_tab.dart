import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Commutateur d'onglets segmented (Connexion / Inscription) fluide et ergonomique.
class AuthSegmentedTab extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const AuthSegmentedTab({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: const Color(0xFFDCE9FF), // surface-container-high
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          // Onglet 0: Connexion
          Expanded(
            child: _TabButton(
              title: 'Connexion',
              icon: Icons.vpn_key_rounded,
              isSelected: selectedIndex == 0,
              onTap: () => onTabChanged(0),
            ),
          ),
          // Onglet 1: Inscription
          Expanded(
            child: _TabButton(
              title: 'Inscription',
              icon: Icons.person_add_rounded,
              isSelected: selectedIndex == 1,
              onTap: () => onTabChanged(1),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 6.r,
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
              size: 18.sp,
              color: isSelected
                  ? AppColors.secondary
                  : AppColors.onSurfaceVariant,
            ),
            8.horizontalSpace,
            Text(
              title,
              style: AppTypography.labelLg.copyWith(
                fontSize: 13.sp,
                color: isSelected
                    ? AppColors.primaryContainer
                    : AppColors.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
