import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

/// Cubit d'authentification AutoLoc basé sur Freezed.
/// - Responsabilité unique (SRP) : Orchestration de la logique métier et de l'état UI.
/// - Zéro dépendance d'interface : Permet aux widgets d'être 100 % Stateless.
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(const AuthState());

  /// 1. Vérification automatique de session au lancement de l'application
  Future<void> checkAuthStatus() async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(state.copyWith(
          status: AuthStatus.authenticated,
          user: user,
          errorMessage: null,
        ));
      } else {
        emit(state.copyWith(
          status: AuthStatus.unauthenticated,
          user: null,
          errorMessage: null,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        user: null,
        errorMessage: null,
      ));
    }
  }

  /// 2. Commutation d'onglet (Connexion / Inscription)
  void setTab(AuthTab tab) {
    emit(state.copyWith(selectedTab: tab));
  }

  /// 3. Changement de langue (FR / EN / عربي)
  void setLanguage(AppLanguage language) {
    emit(state.copyWith(language: language));
  }

  /// 4. Sélection du profil (Particulier / Touriste vs VIP Business)
  void setBusinessProfile(bool isBusiness) {
    emit(state.copyWith(isBusinessProfile: isBusiness));
  }

  /// 5. Afficher / Masquer le mot de passe
  void togglePasswordVisibility() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  /// 6. Case à cocher : Mémoriser cet appareil VIP
  void toggleRememberDevice(bool remember) {
    emit(state.copyWith(rememberDevice: remember));
  }

  /// 7. Case à cocher : Conditions Générales et protocole IA
  void toggleAgreeTerms(bool agree) {
    emit(state.copyWith(agreeTerms: agree));
  }

  /// 8. Mises à jour des champs du formulaire de Connexion
  void updateLoginIdentifier(String value) {
    emit(state.copyWith(loginIdentifier: value));
  }

  void updateLoginPassword(String value) {
    emit(state.copyWith(loginPassword: value));
  }

  /// 9. Mises à jour des champs du formulaire d'Inscription
  void updateRegisterFullName(String value) {
    emit(state.copyWith(registerFullName: value));
  }

  void updateRegisterPhone(String value) {
    emit(state.copyWith(registerPhone: value));
  }

  void updateRegisterEmail(String value) {
    emit(state.copyWith(registerEmail: value));
  }

  void updateRegisterPassword(String value) {
    emit(state.copyWith(registerPassword: value));
  }

  void updateRegisterLicense(String value) {
    emit(state.copyWith(registerLicense: value));
  }

  /// 10. Action : Connexion par identifiant et mot de passe
  Future<void> login() async {
    if (state.loginIdentifier.trim().isEmpty) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Veuillez saisir votre identifiant',
      ));
      return;
    }
    if (state.loginPassword.length < 6) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Le mot de passe doit comporter au moins 6 caractères',
      ));
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    try {
      final user = await authRepository.login(
        identifier: state.loginIdentifier.trim(),
        password: state.loginPassword.trim(),
      );
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// 11. Action : Connexion rapide biométrique VIP (Face ID / Empreinte)
  Future<void> loginBiometric() async {
    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    try {
      final user = await authRepository.login(
        identifier: 'sahar.vip@autoloc.tn',
        password: 'secret_biometric_pass',
      );
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      ));
    }
  }

  /// 12. Action : Inscription et accréditation VIP
  Future<void> register() async {
    if (!state.agreeTerms) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Veuillez accepter les Conditions Générales VIP.',
      ));
      return;
    }
    if (state.registerFullName.trim().isEmpty) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Veuillez renseigner votre nom complet.',
      ));
      return;
    }
    if (!state.registerEmail.contains('@')) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Adresse e-mail invalide.',
      ));
      return;
    }
    if (state.registerPassword.length < 6) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Le mot de passe doit comporter au moins 6 caractères.',
      ));
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));
    try {
      final user = await authRepository.register(
        fullName: state.registerFullName.trim(),
        email: state.registerEmail.trim(),
        phone: state.registerPhone.trim(),
        password: state.registerPassword.trim(),
      );
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString().replaceAll('Exception: ', ''),
      ));
    }
  }
}
