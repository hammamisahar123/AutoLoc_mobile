import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../widgets/splash_background_glow.dart';
import '../widgets/splash_brand_center.dart';
import '../widgets/splash_fleet_badge.dart';
import '../widgets/splash_progress_bar.dart';

/// Écran de démarrage (Splash Screen) AutoLoc.
/// - Architecture Clean : Découpé en composants modulaires (SRP).
/// - 100 % Responsive grâce à flutter_screenutil.
/// - Piloté par AuthCubit pour la vérification automatique de session.
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Déclenchement de la vérification de session après 2.5 secondes
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (context.mounted) {
        context.read<AuthCubit>().checkAuthStatus();
      }
    });

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Session active : M/Mme ${state.user.fullName} (VIP)'),
              backgroundColor: AppColors.secondary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
          );
        } else if (state is Unauthenticated) {
          // Aucun utilisateur -> Redirection fluide vers la page de Connexion VIP
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const LoginPage(),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary, // Midnight Navy
        body: Stack(
          children: [
            // 1. Ambiance lumineuse d'arrière-plan
            const SplashBackgroundGlow(),

            // 2. Contenu structuré
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 24.h,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SplashFleetBadge(),
                    SplashBrandCenter(),
                    SplashProgressBar(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
