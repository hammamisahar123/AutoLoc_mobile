import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

/// Barre de chargement dorée minimaliste pour l'écran de splash.
class SplashProgressBar extends StatelessWidget {
  const SplashProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: SizedBox(
        width: 140.w,
        child: LinearProgressIndicator(
          backgroundColor: Colors.white.withValues(alpha: 0.1),
          valueColor: const AlwaysStoppedAnimation<Color>(
            AppColors.secondary,
          ),
          borderRadius: BorderRadius.circular(999.r),
          minHeight: 3.h,
        ),
      ),
    );
  }
}
