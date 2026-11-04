import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';

/// Sélecteur de type de compte VIP Tunisie - 100 % StatelessWidget.
class ProfileTypeSelector extends StatelessWidget {
  const ProfileTypeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (prev, curr) => prev.isBusinessProfile != curr.isBusinessProfile,
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        final isBusiness = state.isBusinessProfile;

        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF4FF),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  _ProfileOptionCard(
                    title: 'Particulier',
                    subtitle: 'Côtes de Carthage & Tarmac',
                    icon: Icons.person_rounded,
                    isSelected: !isBusiness,
                    onTap: () => cubit.setBusinessProfile(false),
                  ),
                  _ProfileOptionCard(
                    title: 'VIP Business',
                    subtitle: 'Matricule Fiscal (MF) & TND',
                    icon: Icons.corporate_fare_rounded,
                    isSelected: isBusiness,
                    accentSubtitle: true,
                    onTap: () => cubit.setBusinessProfile(true),
                  ),
                ],
              ),
            ),
            if (isBusiness) ...[
              12.verticalSpace,
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF4FF),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: const Color(0xFFDCE9FF), width: 1.w),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.verified_rounded, color: AppColors.secondary, size: 18.sp),
                    8.horizontalSpace,
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'Avantage Flotte Premium Tunisie : ',
                          style: AppTypography.labelSm.copyWith(
                            color: AppColors.primaryContainer,
                            fontWeight: FontWeight.w800,
                            fontSize: 11.sp,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Facturation centralisée trimestrielle en Dinars Tunisiens (TND) avec TVA récupérable et chauffeur bilingue inclus.',
                              style: AppTypography.bodySm.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

class _ProfileOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final bool accentSubtitle;
  final VoidCallback onTap;

  const _ProfileOptionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    this.accentSubtitle = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 16.sp,
                    color: isSelected
                        ? (accentSubtitle ? AppColors.secondary : AppColors.primaryContainer)
                        : AppColors.onSurfaceVariant,
                  ),
                  6.horizontalSpace,
                  Text(
                    title,
                    style: AppTypography.labelMd.copyWith(
                      color: isSelected
                          ? AppColors.primaryContainer
                          : AppColors.onSurfaceVariant,
                      fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              2.verticalSpace,
              Text(
                subtitle,
                style: AppTypography.labelSm.copyWith(
                  color: accentSubtitle && isSelected
                      ? AppColors.secondary
                      : AppColors.onSurfaceVariant,
                  fontWeight: accentSubtitle && isSelected
                      ? FontWeight.w700
                      : FontWeight.normal,
                  fontSize: 9.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
