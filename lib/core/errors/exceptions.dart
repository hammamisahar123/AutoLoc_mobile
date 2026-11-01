/// Classe de base abstraite pour toutes les exceptions techniques (Data Layer).
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  const AppException(this.message, {this.statusCode});

  @override
  String toString() => '$runtimeType: $message (code: $statusCode)';
}

/// Exception levée lors d'une réponse d'erreur de l'API REST.
class ServerException extends AppException {
  const ServerException(super.message, {super.statusCode});
}

/// Exception levée lors d'un problème avec le cache / stockage local.
class CacheException extends AppException {
  const CacheException([super.message = 'Erreur d\'accès au stockage local.']);
}

/// Exception levée quand l'appareil n'a pas accès au réseau.
class NetworkException extends AppException {
  const NetworkException([super.message = 'Pas de connexion réseau disponible.']);
}

/// Exception levée lors d'une erreur 401 ou 403.
class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Accès non autorisé.']);
}
