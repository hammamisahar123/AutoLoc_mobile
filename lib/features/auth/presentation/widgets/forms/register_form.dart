import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../core/widgets/vip_checkbox.dart';
import '../../../../../core/widgets/vip_gold_button.dart';
import '../../../../../core/widgets/vip_phone_field.dart';
import '../../../../../core/widgets/vip_svg_icon.dart';
import '../../../../../core/widgets/vip_text_field.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import 'password_strength_meter.dart';
import '../cards/register_testimonial_card.dart';

/// Formulaire d'accréditation VIP AutoLoc Tunisie - 100 % StatelessWidget & SRP.
class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        final isLoading = state.status == AuthStatus.loading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Nom & Prénom complet selon CIN ou Passeport
            VipTextField(
              label: 'Nom & Prénom (selon CIN ou Passeport)',
              hint: 'ex. Karim Ben Salem',
              initialValue: state.registerFullName,
              isRequired: true,
              enabled: !isLoading,
              leadingIcon: Icons.badge_outlined,
              onChanged: cubit.updateRegisterFullName,
              trailing: Icon(
                Icons.check_circle_rounded,
                size: 16.sp,
                color: const Color(0xFF2E7D32),
              ),
            ),
            14.verticalSpace,

            // 2. Numéro de téléphone mobile tunisien
            VipPhoneField(
              label: 'Numéro mobile tunisien (+216 🇹🇳)',
              badgeText: 'OTP Express Tunisie',
              initialValue: state.registerPhone,
              enabled: !isLoading,
              onChanged: cubit.updateRegisterPhone,
            ),
            14.verticalSpace,

            // 3. Adresse e-mail officielle ou d'ambassade
            VipTextField(
              label: state.isBusinessProfile
                  ? 'Courriel professionnel d\'entreprise'
                  : 'Courriel personnel ou diplomatique',
              hint: state.isBusinessProfile
                  ? 'direction@holding-carthage.tn'
                  : 'karim@gmail.com',
              initialValue: state.registerEmail,
              isRequired: true,
              enabled: !isLoading,
              keyboardType: TextInputType.emailAddress,
              leadingIcon: Icons.mail_outline_rounded,
              onChanged: cubit.updateRegisterEmail,
            ),
            14.verticalSpace,

            // 4. Mot de passe confidentiel avec SVG SSL
            VipTextField(
              label: 'Mot de passe confidentiel',
              hint: '••••••••••••',
              initialValue: state.registerPassword,
              isRequired: true,
              obscureText: state.obscurePassword,
              enabled: !isLoading,
              leadingWidget: const VipSvgIcon('ssl_lock', size: 18, color: AppColors.onSurfaceVariant),
              onChanged: cubit.updateRegisterPassword,
              trailing: GestureDetector(
                onTap: cubit.togglePasswordVisibility,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      state.obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 16.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                    4.horizontalSpace,
                    Text(
                      state.obscurePassword ? 'Afficher' : 'Masquer',
                      style: AppTypography.labelSm.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            8.verticalSpace,
            PasswordStrengthMeter(password: state.registerPassword),
            14.verticalSpace,

            // 5. Permis de conduire (Optionnel / Clé numérique)
            VipTextField(
              label: 'Numéro de permis tunisien ou international',
              hint: 'ex. 12/345678 ou Permis Diplomatique',
              badgeText: 'Clé Tarmac Pass (Optionnel)',
              initialValue: state.registerLicense,
              enabled: !isLoading,
              leadingWidget: const VipSvgIcon('car_luxury', size: 18, color: AppColors.onSurfaceVariant),
              onChanged: cubit.updateRegisterLicense,
              trailing: Icon(
                Icons.photo_camera_outlined,
                size: 18.sp,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            4.verticalSpace,
            Text(
              'Ajoutable plus tard pour déblocage instantané du véhicule via smartphone.',
              style: AppTypography.labelSm.copyWith(
                color: AppColors.onSurfaceVariant,
                fontSize: 10.sp,
              ),
            ),
            16.verticalSpace,

            // 6. Conditions Générales & Protocole IA certifié INPDP Tunisie (Loi 2004-63)
            VipCheckbox(
              value: state.agreeTerms,
              label: 'J\'accepte les Conditions Générales AutoLoc et le protocole IA certifié conforme à la Loi Tunisienne N° 2004-63 (INPDP).',
              onChanged: cubit.toggleAgreeTerms,
            ),
            18.verticalSpace,

            // 7. Bouton Primaire Doré
            VipGoldButton(
              text: 'Valider mon Accréditation VIP Tunis',
              isLoading: isLoading,
              onPressed: cubit.register,
            ),
            16.verticalSpace,

            // 8. Badges de sécurité
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const VipSvgIcon('ssl_lock', size: 14, color: AppColors.secondary),
                4.horizontalSpace,
                Text(
                  'Données 256-bit SSL',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                8.horizontalSpace,
                Text('•', style: TextStyle(color: AppColors.outline, fontSize: 10.sp)),
                8.horizontalSpace,
                const VipSvgIcon('carthage_shield', size: 14, color: AppColors.secondary),
                4.horizontalSpace,
                Text(
                  'Priorité Salon Carthage 24/7',
                  style: AppTypography.labelSm.copyWith(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            16.verticalSpace,

            // 9. Témoignage tarmac
            const RegisterTestimonialCard(),
          ],
        );
      },
    );
  }
}
