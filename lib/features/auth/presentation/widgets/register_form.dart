import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'password_strength_meter.dart';
import 'register_testimonial_card.dart';

/// Formulaire d'accréditation et de création de compte VIP AutoLoc.
class RegisterForm extends StatefulWidget {
  final bool isBusiness;

  const RegisterForm({super.key, required this.isBusiness});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController(text: 'Karim Ben Salem');
  final _phoneController = TextEditingController(text: '98 123 456');
  final _emailController = TextEditingController(text: 'karim.bensalem@ambassade-vip.tn');
  final _passwordController = TextEditingController(text: 'Monaco2026#');
  final _licenseController = TextEditingController();

  bool _obscurePassword = true;
  bool _agreeTerms = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _licenseController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_agreeTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez accepter les Conditions Générales VIP.'),
        ),
      );
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().register(
            fullName: _fullNameController.text.trim(),
            email: _emailController.text.trim(),
            phone: '+216 ${_phoneController.text.trim()}',
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
              // 1. Nom & Prénom complet
              _buildInputLabel('Nom & Prénom complet', isRequired: true),
              6.verticalSpace,
              _buildInputContainer(
                child: Row(
                  children: [
                    Icon(
                      Icons.badge_outlined,
                      size: 18.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        controller: _fullNameController,
                        enabled: !isLoading,
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.primaryContainer,
                          fontSize: 13.sp,
                        ),
                        decoration: _inputDecoration('ex. Karim Ben Salem'),
                        validator: (v) =>
                            v == null || v.isEmpty ? 'Requis' : null,
                      ),
                    ),
                    Icon(
                      Icons.check_circle_rounded,
                      size: 16.sp,
                      color: const Color(0xFF2E7D32),
                    ),
                  ],
                ),
              ),
              14.verticalSpace,

              // 2. Numéro de téléphone portable (OTP Express)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInputLabel('Numéro de téléphone mobile', isRequired: true),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEC325).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Text(
                      'OTP Express',
                      style: AppTypography.labelSm.copyWith(
                        color: const Color(0xFF6E5200),
                        fontWeight: FontWeight.w800,
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              _buildInputContainer(
                child: Row(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('🇹🇳', style: TextStyle(fontSize: 16.sp)),
                        6.horizontalSpace,
                        Text(
                          '+216',
                          style: AppTypography.labelMd.copyWith(
                            color: AppColors.primaryContainer,
                            fontWeight: FontWeight.w800,
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
                        controller: _phoneController,
                        enabled: !isLoading,
                        keyboardType: TextInputType.phone,
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.primaryContainer,
                          fontSize: 13.sp,
                        ),
                        decoration: _inputDecoration('98 123 456'),
                        validator: (v) =>
                            v == null || v.isEmpty ? 'Requis' : null,
                      ),
                    ),
                    Icon(
                      Icons.sms_outlined,
                      size: 18.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ],
                ),
              ),
              14.verticalSpace,

              // 3. Adresse e-mail
              _buildInputLabel(
                widget.isBusiness
                    ? 'Adresse e-mail professionnelle'
                    : 'Adresse e-mail personnelle',
                isRequired: true,
              ),
              6.verticalSpace,
              _buildInputContainer(
                child: Row(
                  children: [
                    Icon(
                      Icons.mail_outline_rounded,
                      size: 18.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        enabled: !isLoading,
                        keyboardType: TextInputType.emailAddress,
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.primaryContainer,
                          fontSize: 13.sp,
                        ),
                        decoration: _inputDecoration(
                          widget.isBusiness
                              ? 'direction@holding-vip.tn'
                              : 'karim@gmail.com',
                        ),
                        validator: (v) =>
                            v == null || !v.contains('@') ? 'Courriel invalide' : null,
                      ),
                    ),
                  ],
                ),
              ),
              14.verticalSpace,

              // 4. Mot de passe + Jauge de force
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInputLabel('Mot de passe confidentiel', isRequired: true),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 14.sp,
                          color: AppColors.onSurfaceVariant,
                        ),
                        4.horizontalSpace,
                        Text(
                          _obscurePassword ? 'Afficher' : 'Masquer',
                          style: AppTypography.labelSm.copyWith(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              6.verticalSpace,
              _buildInputContainer(
                child: Row(
                  children: [
                    Icon(
                      Icons.lock_outline_rounded,
                      size: 18.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        controller: _passwordController,
                        enabled: !isLoading,
                        obscureText: _obscurePassword,
                        onChanged: (val) {
                          setState(() {});
                        },
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.primaryContainer,
                          fontSize: 13.sp,
                        ),
                        decoration: _inputDecoration('••••••••••••'),
                        validator: (v) =>
                            v == null || v.length < 6 ? 'Minimum 6 caractères' : null,
                      ),
                    ),
                    Icon(
                      Icons.shield_rounded,
                      size: 18.sp,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              ),
              8.verticalSpace,
              PasswordStrengthMeter(password: _passwordController.text),
              14.verticalSpace,

              // 5. Permis de conduire (Optionnel / Fast Pass Clé Numérique)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildInputLabel('Numéro de permis de conduire'),
                      4.horizontalSpace,
                      Text(
                        '(Optionnel)',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.bolt_rounded,
                        size: 14.sp,
                        color: AppColors.secondary,
                      ),
                      4.horizontalSpace,
                      Text(
                        'Clé numérique',
                        style: AppTypography.labelSm.copyWith(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              6.verticalSpace,
              _buildInputContainer(
                child: Row(
                  children: [
                    Icon(
                      Icons.directions_car_rounded,
                      size: 18.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: TextFormField(
                        controller: _licenseController,
                        enabled: !isLoading,
                        style: AppTypography.bodyMd.copyWith(
                          color: AppColors.primaryContainer,
                          fontSize: 13.sp,
                        ),
                        decoration: _inputDecoration(
                          'ex. 12/345678 ou Permis International',
                        ),
                      ),
                    ),
                    Icon(
                      Icons.photo_camera_outlined,
                      size: 18.sp,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ],
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

              // 6. Conditions Générales & Protocole IA d'Inspection
              GestureDetector(
                onTap: () {
                  setState(() {
                    _agreeTerms = !_agreeTerms;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                      height: 20.w,
                      child: Checkbox(
                        value: _agreeTerms,
                        activeColor: AppColors.primaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _agreeTerms = val ?? true;
                          });
                        },
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: Text(
                        'J\'accepte les Conditions Générales VIP et le protocole d\'inspection numérique par IA certifiée à chaque remise de clé.',
                        style: AppTypography.bodySm.copyWith(
                          color: AppColors.onSurface,
                          fontSize: 11.sp,
                          height: 1.35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              18.verticalSpace,

              // 7. Bouton Primaire Doré
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: isLoading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEC325),
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
                              'Créer mon compte VIP',
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
              16.verticalSpace,

              // 8. Badges de sécurité et Témoignage
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_rounded,
                    size: 13.sp,
                    color: AppColors.secondary,
                  ),
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
                  Icon(
                    Icons.stars_rounded,
                    size: 13.sp,
                    color: AppColors.secondary,
                  ),
                  4.horizontalSpace,
                  Text(
                    'Priorité Salon VIP',
                    style: AppTypography.labelSm.copyWith(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              16.verticalSpace,

              // 9. Témoignage tarmac Tunis-Carthage
              const RegisterTestimonialCard(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputLabel(String text, {bool isRequired = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: AppTypography.labelMd.copyWith(
            color: AppColors.primaryContainer,
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
          ),
        ),
        if (isRequired) ...[
          2.horizontalSpace,
          Text(
            '*',
            style: TextStyle(color: AppColors.error, fontSize: 12.sp),
          ),
        ],
      ],
    );
  }

  Widget _buildInputContainer({required Widget child}) {
    return Container(
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
      child: child,
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: AppTypography.bodyMd.copyWith(
        color: AppColors.outline.withValues(alpha: 0.6),
        fontSize: 12.sp,
      ),
      border: InputBorder.none,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 12.h),
    );
  }
}
