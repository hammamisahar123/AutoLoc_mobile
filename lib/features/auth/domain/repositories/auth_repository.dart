import '../entities/user_entity.dart';

/// Contrat abstrait définissant les actions d'authentification disponibles.
/// En Clean Architecture, le Domaine dit "QUOI faire", sans se soucier du "COMMENT".
abstract class AuthRepository {
  /// Vérifie si l'utilisateur a déjà une session mémorisée dans le téléphone (pour le Splash).
  Future<UserEntity?> getCurrentUser();

  /// Connexion avec identifiant (email ou téléphone +216) et mot de passe.
  Future<UserEntity> login({
    required String identifier,
    required String password,
  });

  /// Inscription d'un nouveau membre VIP.
  Future<UserEntity> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  });

  /// Déconnexion et nettoyage du cache.
  Future<void> logout();
}