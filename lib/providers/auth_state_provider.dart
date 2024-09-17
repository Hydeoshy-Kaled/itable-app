import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthMode { Signup, Login }

class AuthStateNotifier extends StateNotifier<AuthMode> {
  AuthStateNotifier() : super(AuthMode.Login);

  void toggleAuthMode() {
    state = state == AuthMode.Login ? AuthMode.Signup : AuthMode.Login;
  }
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthMode>((ref) {
  return AuthStateNotifier();
});