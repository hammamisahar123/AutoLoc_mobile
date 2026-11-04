import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

/// Halo lumineux doré d'arrière-plan pour l'ambiance VIP / Luxe.
class SplashBackgroundGlow extends StatelessWidget {
  const SplashBackgroundGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.28.sh,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          width: 260.w,
          height: 260.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.secondary.withValues(alpha: 0.18),
                blurRadius: 90.r,
                spreadRadius: 20.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
