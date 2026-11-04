import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

/// Statut global du cycle de vie de l'authentification.
enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

/// Onglet d'authentification actif (Connexion vs Inscription).
enum AuthTab {
  login,
  register,
}

/// Langue sélectionnée dans l'application.
enum AppLanguage {
  fr,
  en,
  ar,
}

/// État global et immuable de l'authentification généré par Freezed.
/// - Sépare à 100 % la logique et les données de l'interface (UI).
/// - Permet des widgets d'affichage 100 % Stateless.
@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    UserEntity? user,
    String? errorMessage,

    // États d'interface & navigation (gérés par le Cubit)
    @Default(AuthTab.login) AuthTab selectedTab,
    @Default(AppLanguage.fr) AppLanguage language,
    @Default(false) bool isBusinessProfile,
    @Default(true) bool obscurePassword,
    @Default(true) bool rememberDevice,
    @Default(true) bool agreeTerms,

    // Champs du formulaire de Connexion
    @Default('contact@ambassade.tn') String loginIdentifier,
    @Default('secret123') String loginPassword,

    // Champs du formulaire d'Inscription
    @Default('Karim Ben Salem') String registerFullName,
    @Default('98 123 456') String registerPhone,
    @Default('karim.bensalem@ambassade-vip.tn') String registerEmail,
    @Default('Monaco2026#') String registerPassword,
    @Default('') String registerLicense,
  }) = _AuthState;
}
