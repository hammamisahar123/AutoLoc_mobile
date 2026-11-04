import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

/// Champ de texte haute sécurité VIP réutilisable (Design System AutoLoc).
class VipTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String initialValue;
  final ValueChanged<String> onChanged;
  final IconData? leadingIcon;
  final Widget? trailing;
  final String? badgeText;
  final bool isRequired;
  final bool obscureText;
  final bool enabled;
  final TextInputType keyboardType;

  const VipTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.onChanged,
    this.leadingIcon,
    this.trailing,
    this.badgeText,
    this.isRequired = false,
    this.obscureText = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // En-tête : Label + Astérisque + Badge optionnel
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
                if (isRequired) ...[
                  2.horizontalSpace,
                  Text('*', style: TextStyle(color: AppColors.error, fontSize: 12.sp)),
                ],
              ],
            ),
            if (badgeText != null)
              Text(
                badgeText!,
                style: AppTypography.labelSm.copyWith(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 10.sp,
                ),
              ),
          ],
        ),
        6.verticalSpace,

        // Conteneur de saisie avec ombre douce
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
              if (leadingIcon != null) ...[
                Icon(leadingIcon, size: 18.sp, color: AppColors.onSurfaceVariant),
                10.horizontalSpace,
              ],
              Expanded(
                child: TextFormField(
                  initialValue: initialValue,
                  enabled: enabled,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  onChanged: onChanged,
                  style: AppTypography.bodyMd.copyWith(
                    color: AppColors.primaryContainer,
                    fontSize: 13.sp,
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
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
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ],
    );
  }
}
