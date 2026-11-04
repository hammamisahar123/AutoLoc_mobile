import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/vip_svg_icon.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

/// Bannière supérieure de prestige pour la Connexion VIP Tunis-Carthage.
class LoginHeaderBanner extends StatelessWidget {
  const LoginHeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.primary, // Midnight Navy officiel
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 15.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Barre d'utilité : Marque + Sélecteur de Langue + Badge VIP Carthage
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBrandChip(),
                  Row(
                    children: [
                      const _LanguageSelectorPill(),
                      8.horizontalSpace,
                      Container(
                        width: 32.w,
                        height: 32.w,
                        decoration: const BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: VipSvgIcon(
                            'carthage_shield',
                            size: 18,
                            color: Color(0xFF251A00),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.verticalSpace,

              // 2. Badge salon d'honneur VIP Carthage
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(999.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6.w,
                      height: 6.w,
                      decoration: const BoxDecoration(
                        color: AppColors.secondary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    6.horizontalSpace,
                    Text(
                      'TUNIS-CARTHAGE SALON D\'HONNEUR',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.secondary,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              8.verticalSpace,

              // 3. Titre d'accueil
              Text(
                'Bon retour parmi nous',
                style: AppTypography.headlineXl.copyWith(
                  color: Colors.white,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandChip() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const VipSvgIcon('vip_crown', size: 14, color: AppColors.secondary),
          6.horizontalSpace,
          Text(
            'AUTOLOC CONCIERGE',
            style: AppTypography.labelSm.copyWith(
              color: Colors.white,
              fontSize: 10.sp,
              letterSpacing: 1.1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageSelectorPill extends StatelessWidget {
  const _LanguageSelectorPill();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (prev, curr) => prev.language != curr.language,
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(999.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildItem(context, 'FR', AppLanguage.fr, state.language),
              _buildItem(context, 'EN', AppLanguage.en, state.language),
              _buildItem(context, 'عربي', AppLanguage.ar, state.language),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(
    BuildContext context,
    String label,
    AppLanguage lang,
    AppLanguage current,
  ) {
    final isSelected = current == lang;
    return GestureDetector(
      onTap: () => context.read<AuthCubit>().setLanguage(lang),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : Colors.transparent,
          borderRadius: BorderRadius.circular(999.r),
        ),
        child: Text(
          label,
          style: AppTypography.labelSm.copyWith(
            color: isSelected
                ? const Color(0xFF251A00)
                : Colors.white.withValues(alpha: 0.75),
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
            fontSize: 10.sp,
          ),
        ),
      ),
    );
  }
}
