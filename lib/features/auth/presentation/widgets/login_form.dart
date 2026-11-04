import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/vip_checkbox.dart';
import '../../../../core/widgets/vip_gold_button.dart';
import '../../../../core/widgets/vip_phone_field.dart';
import '../../../../core/widgets/vip_text_field.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

/// Formulaire de connexion - 100 % StatelessWidget, SRP & concis.
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        final isLoading = state.status == AuthStatus.loading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Champ Identifiant (+216 🇹🇳)
            VipPhoneField(
              label: 'Courriel ou Téléphone d\'entreprise',
              badgeText: 'Protégé SSL',
              initialValue: state.loginIdentifier,
              enabled: !isLoading,
              onChanged: cubit.updateLoginIdentifier,
            ),
            16.verticalSpace,

            // 2. Champ Mot de passe
            VipTextField(
              label: 'Mot de passe personnel',
              hint: '••••••••••••',
              initialValue: state.loginPassword,
              obscureText: state.obscurePassword,
              enabled: !isLoading,
              leadingIcon: Icons.lock_outline_rounded,
              onChanged: cubit.updateLoginPassword,
              trailing: GestureDetector(
                onTap: cubit.togglePasswordVisibility,
                child: Icon(
                  state.obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.outline,
                  size: 18.sp,
                ),
              ),
            ),
            12.verticalSpace,

            // 3. Mémoriser + Chiffrement AES-256
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VipCheckbox(
                  value: state.rememberDevice,
                  label: 'Mémoriser cet appareil VIP',
                  onChanged: cubit.toggleRememberDevice,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDF9C).withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Text(
                    'Chiffré AES-256',
                    style: AppTypography.labelSm.copyWith(
                      color: const Color(0xFF5B4300),
                      fontWeight: FontWeight.w800,
                      fontSize: 9.sp,
                    ),
                  ),
                ),
              ],
            ),
            16.verticalSpace,

            // 4. Bouton CTA Doré Majeur
            VipGoldButton(
              text: 'Se Connecter à l\'espace Concierge',
              isLoading: isLoading,
              onPressed: cubit.login,
            ),
          ],
        );
      },
    );
  }
}
