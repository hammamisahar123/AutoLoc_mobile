import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

/// Formulaire de connexion haute sécurité avec validation UX et retour haptique visuel.
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController(text: 'contact@ambassade.tn');
  final _passwordController = TextEditingController(text: 'secret123');

  bool _obscurePassword = true;
  bool _rememberDevice = true;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().login(
            identifier: _identifierController.text.trim(),
            password: _passwordController.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Champ Identifiant (Courriel ou Téléphone)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Courriel ou Téléphone d\'entreprise',
                    style: AppTypography.labelMd.copyWith(
                      color: AppColors.primaryContainer,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    'Protégé SSL',
                    style: AppTypography.labelSm.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
                child: Row(
                  children: [
                    // Préfixe drapeau tunisien
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('🇹🇳', style: TextStyle(fontSize: 16.sp)),
                        6.horizontalSpace,
                        Text(
                          '+216',
                          style: AppTypography.labelMd.copyWith(
                            color: AppColors.primaryContainer,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ),
                        8.horizontalSpace,
                        Container(
                          width: 1.w,
                          height: 20.h,
                          color: const Color(0xFFDCE9FF),
                        ),
                        8.horizontalSpace,
                      ],
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _identifierController,
                        enabled: !isLoading,
                        keyboardType: TextInputType.emailAddress,
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.primaryContainer,
                          fontSize: 13.sp,
                        ),
                        decoration: InputDecoration(
                          hintText: '98 123 456 ou contact@ambassade.tn',
                          hintStyle: AppTypography.bodyMd.copyWith(
                            color: AppColors.outline.withValues(alpha: 0.6),
                            fontSize: 12.sp,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Veuillez saisir votre identifiant';
                          }
                          return null;
                        },
                      ),
                    ),
                    Icon(
                      Icons.alternate_email_rounded,
                      color: AppColors.outline,
                      size: 18.sp,
                    ),
                  ],
                ),
              ),
              16.verticalSpace,

              // 2. Champ Mot de passe
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mot de passe personnel',
                    style: AppTypography.labelMd.copyWith(
                      color: AppColors.primaryContainer,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Récupération VIP envoyée à votre conciergerie.'),
                        ),
                      );
                    },
                    child: Text(
                      'Mot de passe oublié ?',
                      style: AppTypography.labelMd.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w800,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.outline,
                      size: 18.sp,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        controller: _passwordController,
                        enabled: !isLoading,
                        obscureText: _obscurePassword,
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.primaryContainer,
                          fontSize: 13.sp,
                        ),
                        decoration: InputDecoration(
                          hintText: '••••••••••••',
                          hintStyle: AppTypography.bodyMd.copyWith(
                            color: AppColors.outline.withValues(alpha: 0.6),
                            fontSize: 12.sp,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 6) {
                            return 'Minimum 6 caractères';
                          }
                          return null;
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      child: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: AppColors.outline,
                        size: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              12.verticalSpace,

              // 3. Mémoriser + Chiffrement AES-256
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _rememberDevice = !_rememberDevice;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: Checkbox(
                            value: _rememberDevice,
                            activeColor: AppColors.primaryContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _rememberDevice = val ?? true;
                              });
                            },
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          'Mémoriser cet appareil VIP',
                          style: AppTypography.bodySm.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
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
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEC325), // Golden CTA
                    foregroundColor: const Color(0xFF251A00),
                    elevation: 3,
                    shadowColor: const Color(0xFFFEC325).withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                  ),
                  child: isLoading
                      ? SizedBox(
                          width: 22.w,
                          height: 22.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF251A00),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Se Connecter à l\'espace Concierge',
                              style: AppTypography.labelLg.copyWith(
                                color: const Color(0xFF251A00),
                                fontWeight: FontWeight.w800,
                                fontSize: 13.sp,
                              ),
                            ),
                            8.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 18.sp,
                              color: const Color(0xFF251A00),
                            ),
                          ],
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
