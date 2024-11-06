import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itable_app/auth/auth.dart';
import 'package:itable_app/pages/auth_page.dart';
import 'package:itable_app/restaurant_page/restaurants_auth_test.dart';

class AuthOrHomePage extends ConsumerWidget {
  const AuthOrHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    final isAuth = authNotifier.isAuth;

    return FutureBuilder(
      future: authNotifier.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return isAuth ? const RestaurantsOverview() : const AuthPage();
        }
      },
    );
  }
}
