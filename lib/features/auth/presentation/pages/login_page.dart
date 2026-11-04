import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_segmented_tab.dart';
import '../widgets/biometric_access_card.dart';
import '../widgets/diplomatic_sso_buttons.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header_banner.dart';
import '../widgets/profile_type_selector.dart';
import '../widgets/register_form.dart';
import '../widgets/register_header_banner.dart';
import '../widgets/vip_service_showcase_card.dart';

/// Page d'authentification et de connexion VIP AutoLoc.
/// - Gère la commutation fluide entre Connexion et Inscription (Accréditation VIP).
/// - 100 % Modulaire, Clean Architecture (SRP) et Responsive via flutter_screenutil.
/// - Conforme aux maquettes connexion_sign_in et inscription_sign_up.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _selectedTabIndex = 0; // 0 = Connexion, 1 = Inscription
  bool _isBusinessProfile = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.stars, color: Color(0xFFFEC325)),
                  10.horizontalSpace,
                  Expanded(
                    child: Text(
                      'Accès VIP autorisé : Bienvenue ${state.user.fullName}',
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
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Bannière d'en-tête dynamique selon l'onglet
              AnimatedCrossFade(
                firstChild: const LoginHeaderBanner(),
                secondChild: const RegisterHeaderBanner(),
                crossFadeState: _selectedTabIndex == 0
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
                    // Onglets segmentés Connexion / Inscription
                    AuthSegmentedTab(
                      selectedIndex: _selectedTabIndex,
                      onTabChanged: (index) {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                    ),
                    18.verticalSpace,

                    // VUE 1 : Connexion
                    if (_selectedTabIndex == 0) ...[
                      Text(
                        'Accédez à votre conciergerie mobile et pilotez vos réservations VIP à l\'Aéroport Tunis-Carthage en temps réel.',
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
                      ProfileTypeSelector(
                        isBusiness: _isBusinessProfile,
                        onChanged: (isBiz) {
                          setState(() {
                            _isBusinessProfile = isBiz;
                          });
                        },
                      ),
                      16.verticalSpace,
                      RegisterForm(isBusiness: _isBusinessProfile),
                    ],

                    20.verticalSpace,

                    // Lien de basculement entre les deux modes
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = _selectedTabIndex == 0 ? 1 : 0;
                          });
                        },
                        child: RichText(
                          text: TextSpan(
                            text: _selectedTabIndex == 0
                                ? 'Nouveau voyageur d\'affaires ? '
                                : 'Déjà membre du Cercle VIP ? ',
                            style: AppTypography.bodyMd.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 12.sp,
                            ),
                            children: [
                              TextSpan(
                                text: _selectedTabIndex == 0
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
        ),
      ),
    );
  }
}
