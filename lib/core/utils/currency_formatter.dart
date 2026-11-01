import '../constants/app_constants.dart';

/// Utilitaire de formatage monétaire pour les prix de location.
abstract class CurrencyFormatter {
  /// Formate un montant numérique en affichage monétaire élégant (ex: "240 €").
  static String format(num amount, {String symbol = AppConstants.defaultCurrencySymbol}) {
    if (amount % 1 == 0) {
      return '${amount.toInt()} $symbol';
    }
    return '${amount.toStringAsFixed(2)} $symbol';
  }

  /// Formate un tarif journalier (ex: "240 €/j").
  static String formatDailyRate(num amount, {String symbol = AppConstants.defaultCurrencySymbol}) {
    return '${format(amount, symbol: symbol)}/j';
  }
}
