/// Classe de base abstraite pour tous les échecs métier (Domain Layer).
abstract class Failure {
  final String message;
  final int? statusCode;

  const Failure(this.message, {this.statusCode});

  @override
  String toString() => '$runtimeType(message: $message, statusCode: $statusCode)';
}

/// Échec lors d'une requête au serveur / API REST.
class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.statusCode});
}

/// Échec lors de la lecture ou écriture du cache local.
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Échec de connexion réseau (pas d'Internet, timeout).
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Vérifiez votre connexion Internet.']);
}

/// Échec d'authentification ou token expiré.
class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Session expirée ou non autorisée.']);
}

/// Échec de validation de formulaire / données invalides.
class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}
