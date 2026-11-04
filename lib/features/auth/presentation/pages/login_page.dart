import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../vehicles/presentation/pages/explore_page.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/widgets.dart';

/// Page d'authentification et de connexion VIP AutoLoc - 100 % StatelessWidget.
/// - Architecture Clean : Séparation totale de l'UI et de la logique via Cubit + Freezed.
/// - Widgets organisés par sous-dossiers (headers/, forms/, cards/) avec barrel export.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated && state.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.stars, color: Color(0xFFFEC325)),
                  10.horizontalSpace,
                  Expanded(
                    child: Text(
                      'Accès VIP autorisé : Bienvenue ${state.user!.fullName}',
                      style: AppTypography.labelMd.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.primaryContainer,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const ExplorePage()),
          );
        } else if (state.status == AuthStatus.error && state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.surface,
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isLogin = state.selectedTab == AuthTab.login;
            final cubit = context.read<AuthCubit>();

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Bannière d'en-tête dynamique selon l'onglet
                  AnimatedCrossFade(
                    firstChild: const LoginHeaderBanner(),
                    secondChild: const RegisterHeaderBanner(),
                    crossFadeState: isLogin
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 250),
                  ),

                  // 2. Contenu principal
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Onglets segmentés (Stateless, pilotés par Cubit)
                        const AuthSegmentedTab(),
                        18.verticalSpace,

                        // VUE 1 : Connexion
                        if (isLogin) ...[
                          Text(
                            'Accédez à votre conciergerie privée et pilotez vos réservations de berlines d\'exception à l\'Aéroport International Tunis-Carthage & Enfidha en temps réel.',
                            style: AppTypography.bodyMd.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 13.sp,
                              height: 1.4,
                            ),
                          ),
                          16.verticalSpace,
                          const LoginForm(),
                          16.verticalSpace,
                          const BiometricAccessCard(),
                          20.verticalSpace,
                          const DiplomaticSsoButtons(),
                        ]
                        // VUE 2 : Inscription / Accréditation VIP
                        else ...[
                          const ProfileTypeSelector(),
                          16.verticalSpace,
                          const RegisterForm(),
                        ],

                        20.verticalSpace,

                        // Lien de basculement entre les deux modes
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              cubit.setTab(
                                isLogin ? AuthTab.register : AuthTab.login,
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: isLogin
                                    ? 'Nouveau voyageur d\'affaires ? '
                                    : 'Déjà membre du Cercle VIP ? ',
                                style: AppTypography.bodyMd.copyWith(
                                  color: AppColors.onSurfaceVariant,
                                  fontSize: 12.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: isLogin
                                        ? 'Créer un profil VIP'
                                        : 'Se connecter',
                                    style: AppTypography.labelMd.copyWith(
                                      color: AppColors.primaryContainer,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 12.sp,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        24.verticalSpace,

                        // Carte Showcase Concierge Carthage & Réassurance Monétique Tunisie
                        const VipServiceShowcaseCard(),
                        24.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
