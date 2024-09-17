import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:itable_app/providers/auth_state_provider.dart';
import 'package:itable_app/utils/app_routes.dart';
import 'button_auth.dart';
import 'package:itable_app/models/auth.dart';

class AuthForm extends ConsumerStatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() => AuthFormState();
}

class AuthFormState extends ConsumerState<AuthForm>
    with SingleTickerProviderStateMixin {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  AnimationController? _controller;
  Animation<double>? _opacityAnimation;
  Animation<Offset>? _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeIn,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    setState(() {
      _isLoading = true;
    });

    _formKey.currentState?.save();

    try {
      final authMode = ref.watch(authStateProvider);
      if (authMode == AuthMode.Login) {
        await ref.read(authProvider.notifier).login(
              _authData['email']!,
              _authData['password']!,
            );
        if (ref.read(authProvider.notifier).isAuth) {
          Navigator.of(context)
              .pushReplacementNamed(AppRoutes.RESTAURANTS_OVERVIEW);
        }
      } else {
        await ref.read(authProvider.notifier).signup(
              _authData['email']!,
              _authData['password']!,
            );
      }

      if (context.mounted) {
        Navigator.of(context)
            .pushReplacementNamed(AppRoutes.RESTAURANTS_OVERVIEW);
      }
    } catch (error) {
      // Tratar o erro de autenticação, talvez mostrar uma mensagem na tela
      print("Erro de autenticação: $error");
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authMode = ref.watch(authStateProvider);

    if (authMode == AuthMode.Signup) {
      _controller?.forward();
    } else {
      _controller?.reverse();
    }

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * 0.85,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 500,
                        height: 40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'E-mail',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder()),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (email) => _authData['email'] = email ?? '',
                          validator: (_email) {
                            final email = _email ?? '';
                            if (email.trim().isEmpty || !email.contains('@')) {
                              return 'Informe um e-mail válido!';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 40,
                        width: 500,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Senha',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder()),
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          controller: _passwordController,
                          onSaved: (password) =>
                              _authData['password'] = password ?? '',
                          validator: (_password) {
                            final password = _password ?? '';
                            if (password.trim().isEmpty ||
                                password.length < 5) {
                              return 'Informe uma senha válida!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: authMode == AuthMode.Login ? 0 : 30),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                        child: FadeTransition(
                          opacity: _opacityAnimation!,
                          child: SlideTransition(
                            position: _slideAnimation!,
                            child: SizedBox(
                              height: 40,
                              width: 500,
                              child: TextFormField(
                                enabled: authMode != AuthMode.Login,
                                decoration: const InputDecoration(
                                  labelText: 'Confirmar senha',
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: true,
                                validator: authMode == AuthMode.Login
                                    ? null
                                    : (_password) {
                                        final password = _password ?? '';
                                        if (password !=
                                            _passwordController.text) {
                                          return 'Senhas informadas não conferem';
                                        }
                                        return null;
                                      },
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (_isLoading)
                        const CircularProgressIndicator()
                      else
                        ButtonAuth(
                          text: authMode == AuthMode.Login
                              ? 'Entrar'
                              : 'Registrar',
                          onPressed: _submit,
                        ),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          ref.read(authStateProvider.notifier).toggleAuthMode();
                        },
                        child: authMode == AuthMode.Login
                            ? Text('Não tem conta? Cadastre-se',
                                style: Theme.of(context).textTheme.titleSmall)
                            : Text('Já possui uma conta? Faça o login',
                                style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
