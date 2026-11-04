import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

/// Implémentation de simulation (Mock) pour le développement et les tests.
/// Couche : DATA. Elle respecte à 100 % le contrat AuthRepository.
class MockAuthRepository implements AuthRepository {
  // Simule la mémoire du téléphone (null = déconnecté)
  UserEntity? _currentUser;

  @override
  Future<UserEntity?> getCurrentUser() async {
    // On simule une micro-pause de 1 seconde (comme si le téléphone lisait le disque sécurisé)
    await Future.delayed(const Duration(milliseconds: 1000));
    return _currentUser;
  }

  @override
  Future<UserEntity> login({
    required String identifier,
    required String password,
  }) async {
    // Simulation d'un appel réseau (1,5 seconde d'attente avec spinner)
    await Future.delayed(const Duration(milliseconds: 1500));

    // Simulation d'une vérification basique de mot de passe
    if (password.length < 6) {
      throw Exception('Le mot de passe doit comporter au moins 6 caractères.');
    }

    // Création de l'utilisateur connecté avec statut VIP AutoLoc
    _currentUser = UserEntity(
      id: 'usr_carthage_001',
      fullName: 'Sahar VIP',
      email: identifier.contains('@') ? identifier : 'sahar@ambassade.tn',
      phone: identifier.contains('@') ? '+216 98 123 456' : identifier,
      isVip: true,
      token: 'jwt_mock_token_concierge_vip_2026',
    );

    return _currentUser!;
  }

  @override
  Future<UserEntity> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    _currentUser = UserEntity(
      id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
      fullName: fullName,
      email: email,
      phone: phone,
      isVip: true,
      token: 'jwt_mock_token_new_user',
    );

    return _currentUser!;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }
}