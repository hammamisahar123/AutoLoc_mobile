import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';

/// Jauge visuelle de robustesse de mot de passe (Password Strength Meter) - Zero Overflow.
class PasswordStrengthMeter extends StatelessWidget {
  final String password;

  const PasswordStrengthMeter({super.key, required this.password});

  int get _strengthScore {
    int score = 0;
    if (password.length >= 8) score++;
    if (password.contains(RegExp(r'[A-Z]'))) score++;
    if (password.contains(RegExp(r'[0-9]'))) score++;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score++;
    return score;
  }

  String get _strengthLabel {
    switch (_strengthScore) {
      case 0:
        return 'Requis';
      case 1:
        return 'Trop faible';
      case 2:
        return 'Moyen';
      case 3:
        return 'Bon niveau';
      case 4:
      default:
        return 'Niveau Robuste';
    }
  }

  Color get _activeColor {
    switch (_strengthScore) {
      case 1:
        return AppColors.error;
      case 2:
        return Colors.orange;
      case 3:
        return const Color(0xFFFEC325);
      case 4:
      default:
        return const Color(0xFF2E7D32);
    }
  }

  @override
  Widget build(BuildContext context) {
    final score = _strengthScore;

    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4FF),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            children: List.generate(4, (index) {
              final isFilled = index < score;
              return Expanded(
                child: Container(
                  height: 4.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: isFilled ? _activeColor : const Color(0xFFDCE9FF),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                ),
              );
            }),
          ),
          6.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      score >= 3 ? Icons.check_circle_rounded : Icons.info_outline_rounded,
                      size: 13.sp,
                      color: _activeColor,
                    ),
                    4.horizontalSpace,
                    Flexible(
                      child: Text(
                        _strengthLabel,
                        style: AppTypography.labelSm.copyWith(
                          color: _activeColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 10.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              Flexible(
                child: Text(
                  '8+ car. • 1 chiffre • 1 majuscule',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 9.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
