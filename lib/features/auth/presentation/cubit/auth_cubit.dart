import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

/// Le Cubit global gérant l'état de session utilisateur pour toute l'application.
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  // À la création, nous démarrons dans l'état AuthInitial
  AuthCubit({required this.authRepository}) : super(const AuthInitial());

  /// 1. Appelé par le Splash Screen pour vérifier la session au démarrage
  Future<void> checkAuthStatus() async {
    emit(const AuthLoading());
    try {
      final user = await authRepository.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(const Unauthenticated());
      }
    } catch (e) {
      emit(const Unauthenticated());
    }
  }

  /// 2. Appelé par le formulaire de Connexion
  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    emit(const AuthLoading());
    try {
      final user = await authRepository.login(
        identifier: identifier,
        password: password,
      );
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  /// 3. Appelé par le formulaire d'Inscription
  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(const AuthLoading());
    try {
      final user = await authRepository.register(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
      );
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  /// 4. Déconnexion
  Future<void> logout() async {
    emit(const AuthLoading());
    await authRepository.logout();
    emit(const Unauthenticated());
  }
}