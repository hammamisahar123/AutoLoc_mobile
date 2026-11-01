/// Constantes globales de l'application AutoLoc.
abstract class AppConstants {
  static const String appName = 'AutoLoc';
  static const String appTagline = 'Executive Concierge Mobility';

  // Timeout réseau
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  // Clés de stockage local (SharedPreferences / SecureStorage)
  static const String userTokenKey = 'autoloc_user_token';
  static const String cachedVehiclesKey = 'autoloc_cached_vehicles';
  static const String activeRentalIdKey = 'autoloc_active_rental_id';

  // Devises et formats par défaut
  static const String defaultCurrencySymbol = '€';
  static const String defaultCurrencyCode = 'EUR';
}
