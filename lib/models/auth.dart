import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itable_app/utils/constants.dart';
import 'package:itable_app/models/store.dart';

final authProvider = StateNotifierProvider<Auth, AuthState>((ref) {
  return Auth();
});


class Auth extends StateNotifier<AuthState> {
  Timer? _logoutTimer;

  Auth() : super(AuthState());

  bool get isAuth {
    final isValid = state.expiryDate?.isAfter(DateTime.now()) ?? false;
    return state.token != null && isValid;
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=${Constants.WEB_API_KEY}';

    final response = await http.post(
      Uri.parse(url),
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    final body = jsonDecode(response.body);
    if (body['error'] != null) {
      throw Exception(body['error']['message']);
    } else {
      state = state.copyWith(
        token: body['idToken'],
        email: body['email'],
        userId: body['localId'],
        expiryDate: DateTime.now().add(
          Duration(
            seconds: int.parse(body['expiresIn']),
          ),
        ),
      );

      Store.saveMap('userData', {
        'token': state.token,
        'email': state.email,
        'userId': state.userId,
        'expiryDate': state.expiryDate!.toIso8601String(),
      });
      

      _autoLogout();
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) return;

    final userData = await Store.getMap('userData');
    if (userData!.isEmpty) return;

    final expiryDate = DateTime.parse(userData['expiryDate'] as String);
    if (expiryDate.isBefore(DateTime.now())) return;

    state = state.copyWith(
      token: userData['token'] as String,
      email: userData['email'] as String,
      userId: userData['userId'] as String,
      expiryDate: expiryDate,
    );
    print('Tentativa de login automático: ${state.token}');
    _autoLogout();
  }

  void logout() {
    state = AuthState();
    _clearLogoutTimer();
    Store.remove('userData');
  }

  void _clearLogoutTimer() {
    _logoutTimer?.cancel();
    _logoutTimer = null;
  }

  void _autoLogout() {
    _clearLogoutTimer();
    final timeToLogout = state.expiryDate!.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout), logout);
  }
}

class AuthState {
  AuthState({
    this.token,
    this.email,
    this.userId,
    this.expiryDate,
  });

  final String? token;
  final String? email;
  final String? userId;
  final DateTime? expiryDate;

  AuthState copyWith({
    String? token,
    String? email,
    String? userId,
    DateTime? expiryDate,
  }) {
    return AuthState(
      token: token ?? this.token,
      email: email ?? this.email,
      userId: userId ?? this.userId,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }
}
