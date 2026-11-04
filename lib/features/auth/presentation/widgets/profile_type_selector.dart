import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

/// Sélecteur de type de compte VIP - 100 % StatelessWidget.
/// L'état du profil (Particulier vs Business) est géré directement par AuthCubit.
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
            // Commutateur double onglet
            Container(
              padding: EdgeInsets.all(4.r),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF4FF),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  // 1. Particulier / Touriste
                  Expanded(
                    child: GestureDetector(
                      onTap: () => cubit.setBusinessProfile(false),
                      behavior: HitTestBehavior.opaque,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: !isBusiness ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: !isBusiness
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
                                  Icons.person_rounded,
                                  size: 16.sp,
                                  color: !isBusiness
                                      ? AppColors.primaryContainer
                                      : AppColors.onSurfaceVariant,
                                ),
                                6.horizontalSpace,
                                Text(
                                  'Particulier',
                                  style: AppTypography.labelMd.copyWith(
                                    color: !isBusiness
                                        ? AppColors.primaryContainer
                                        : AppColors.onSurfaceVariant,
                                    fontWeight: !isBusiness
                                        ? FontWeight.w800
                                        : FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            2.verticalSpace,
                            Text(
                              'Livraison hôtel & aéroport',
                              style: AppTypography.labelSm.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 9.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // 2. VIP Business
                  Expanded(
                    child: GestureDetector(
                      onTap: () => cubit.setBusinessProfile(true),
                      behavior: HitTestBehavior.opaque,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
                        decoration: BoxDecoration(
                          color: isBusiness ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: isBusiness
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
                                  Icons.corporate_fare_rounded,
                                  size: 16.sp,
                                  color: isBusiness
                                      ? AppColors.secondary
                                      : AppColors.onSurfaceVariant,
                                ),
                                6.horizontalSpace,
                                Text(
                                  'VIP Business',
                                  style: AppTypography.labelMd.copyWith(
                                    color: isBusiness
                                        ? AppColors.primaryContainer
                                        : AppColors.onSurfaceVariant,
                                    fontWeight: isBusiness
                                        ? FontWeight.w800
                                        : FontWeight.w600,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                            2.verticalSpace,
                            Text(
                              'TVA Déductible & Facture',
                              style: AppTypography.labelSm.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w700,
                                fontSize: 9.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Carte d'avantage fiscal (si mode Business sélectionné)
            if (isBusiness) ...[
              12.verticalSpace,
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF4FF),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color(0xFFDCE9FF),
                    width: 1.w,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      color: AppColors.secondary,
                      size: 18.sp,
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'Avantage Flotte Premium : ',
                          style: AppTypography.labelSm.copyWith(
                            color: AppColors.primaryContainer,
                            fontWeight: FontWeight.w800,
                            fontSize: 11.sp,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Gestion du matricule fiscal et facturation centralisée trimestrielle avec chauffeur bilingue inclus.',
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
