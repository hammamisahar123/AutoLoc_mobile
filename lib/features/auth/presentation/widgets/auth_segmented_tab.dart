import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

/// Commutateur d'onglets (Connexion / Inscription) - 100 % StatelessWidget.
/// L'état de l'onglet actif est géré directement par AuthCubit.
class AuthSegmentedTab extends StatelessWidget {
  const AuthSegmentedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (prev, curr) => prev.selectedTab != curr.selectedTab,
      builder: (context, state) {
        final isLogin = state.selectedTab == AuthTab.login;

        return Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: const Color(0xFFDCE9FF), // surface-container-high
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Row(
            children: [
              // Onglet Connexion
              Expanded(
                child: _TabButton(
                  title: 'Connexion',
                  icon: Icons.vpn_key_rounded,
                  isSelected: isLogin,
                  onTap: () => context.read<AuthCubit>().setTab(AuthTab.login),
                ),
              ),
              // Onglet Inscription
              Expanded(
                child: _TabButton(
                  title: 'Inscription',
                  icon: Icons.person_add_rounded,
                  isSelected: !isLogin,
                  onTap: () => context.read<AuthCubit>().setTab(AuthTab.register),
                ),
              ),
            ],
          ),
        );
      },
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
