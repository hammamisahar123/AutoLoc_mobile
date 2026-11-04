import 'package:equatable/equatable.dart';
import '../../domain/entities/user_entity.dart';

/// Classe de base abstraite pour tous les états d'authentification.
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// 1. État initial au tout premier lancement de l'application.
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// 2. État de chargement (le Splash vérifie la session, ou l'utilisateur attend après avoir cliqué sur Se Connecter).
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// 3. L'utilisateur est connecté ! Il contient l'objet UserEntity (avec son nom, son statut VIP, etc.).
class Authenticated extends AuthState {
  final UserEntity user;

  const Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

/// 4. Aucun utilisateur connecté (le Splash sait qu'il doit afficher la page de Login).
class Unauthenticated extends AuthState {
  const Unauthenticated();
}

/// 5. Une erreur est survenue (mauvais mot de passe, réseau indisponible, etc.).
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}