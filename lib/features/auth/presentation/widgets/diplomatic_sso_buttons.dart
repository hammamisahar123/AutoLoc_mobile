import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Boutons SSO diplomatique (Apple ID & Google Suite) (< 80 lignes).
class DiplomaticSsoButtons extends StatelessWidget {
  const DiplomaticSsoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider(color: Color(0xFFDCE9FF), thickness: 1)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                'OU IDENTIFICATION DIPLOMATIQUE',
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.outline,
                  letterSpacing: 1.0,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Expanded(child: Divider(color: Color(0xFFDCE9FF), thickness: 1)),
          ],
        ),
        16.verticalSpace,
        Row(
          children: [
            Expanded(
              child: _SsoButton(
                label: 'Apple ID',
                icon: Icon(Icons.apple, size: 20.sp, color: AppColors.primaryContainer),
                onTap: () => _notify(context, 'Connexion via Apple ID...'),
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: _SsoButton(
                label: 'Google Suite',
                icon: Text(
                  'G',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF4285F4),
                  ),
                ),
                onTap: () => _notify(context, 'Connexion via Google Workspace...'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _notify(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}

class _SsoButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final VoidCallback onTap;

  const _SsoButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 6.r,
              offset: Offset(0, 1.h),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            8.horizontalSpace,
            Text(
              label,
              style: AppTypography.labelMd.copyWith(
                color: AppColors.primaryContainer,
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
