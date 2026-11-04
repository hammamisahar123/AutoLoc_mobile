import 'package:equatable/equatable.dart';

/// Entité métier représentant un client VIP AutoLoc.
/// Couche : DOMAIN (Pur Dart, aucune dépendance d'interface UI).
class UserEntity extends Equatable {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final bool isVip;
  final String? token;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.isVip = true,
    this.token,
  });

  /// Grâce à Equatable, Dart sait comparer le contenu de deux UserEntity !
  @override
  List<Object?> get props => [id, fullName, email, phone, isVip, token];
}