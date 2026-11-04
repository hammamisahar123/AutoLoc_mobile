import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

/// Boutons d'authentification fédérée et identification diplomatique (Apple & Google).
class DiplomaticSsoButtons extends StatelessWidget {
  const DiplomaticSsoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. Séparateur avec mention textuelle
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: Color(0xFFDCE9FF),
                thickness: 1,
              ),
            ),
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
            const Expanded(
              child: Divider(
                color: Color(0xFFDCE9FF),
                thickness: 1,
              ),
            ),
          ],
        ),
        16.verticalSpace,

        // 2. Boutons Apple ID & Google Suite
        Row(
          children: [
            Expanded(
              child: _SsoButton(
                label: 'Apple ID',
                iconWidget: Icon(
                  Icons.apple,
                  size: 20.sp,
                  color: AppColors.primaryContainer,
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Connexion sécurisée via Apple ID...'),
                    ),
                  );
                },
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: _SsoButton(
                label: 'Google Suite',
                iconWidget: Text(
                  'G',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF4285F4),
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Connexion sécurisée via Google Workspace...'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SsoButton extends StatelessWidget {
  final String label;
  final Widget iconWidget;
  final VoidCallback onTap;

  const _SsoButton({
    required this.label,
    required this.iconWidget,
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
            iconWidget,
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
