import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Champ de saisie téléphonique avec indicatif tunisien (+216 🇹🇳) réutilisable.
class VipPhoneField extends StatelessWidget {
  final String label;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final bool enabled;
  final String? badgeText;

  const VipPhoneField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.enabled = true,
    this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTypography.labelMd.copyWith(
                    color: AppColors.primaryContainer,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                2.horizontalSpace,
                Text('*', style: TextStyle(color: AppColors.error, fontSize: 12.sp)),
              ],
            ),
            if (badgeText != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEC325).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Text(
                  badgeText!,
                  style: AppTypography.labelSm.copyWith(
                    color: const Color(0xFF6E5200),
                    fontWeight: FontWeight.w800,
                    fontSize: 9.sp,
                  ),
                ),
              ),
          ],
        ),
        6.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
          child: Row(
            children: [
              Text('🇹🇳', style: TextStyle(fontSize: 16.sp)),
              6.horizontalSpace,
              Text(
                '+216',
                style: AppTypography.labelMd.copyWith(
                  color: AppColors.primaryContainer,
                  fontWeight: FontWeight.w800,
                  fontSize: 12.sp,
                ),
              ),
              8.horizontalSpace,
              Container(width: 1.w, height: 20.h, color: const Color(0xFFDCE9FF)),
              8.horizontalSpace,
              Expanded(
                child: TextFormField(
                  initialValue: initialValue,
                  enabled: enabled,
                  keyboardType: TextInputType.phone,
                  onChanged: onChanged,
                  style: AppTypography.bodyMd.copyWith(
                    color: AppColors.primaryContainer,
                    fontSize: 13.sp,
                  ),
                  decoration: InputDecoration(
                    hintText: '98 123 456',
                    hintStyle: AppTypography.bodyMd.copyWith(
                      color: AppColors.outline.withValues(alpha: 0.6),
                      fontSize: 12.sp,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                ),
              ),
              Icon(Icons.sms_outlined, size: 18.sp, color: AppColors.onSurfaceVariant),
            ],
          ),
        ),
      ],
    );
  }
}
