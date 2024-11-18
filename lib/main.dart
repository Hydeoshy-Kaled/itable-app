import 'package:flutter/material.dart';
import 'package:itable_app/pages/auth_page.dart';
import 'package:itable_app/pages/restaurants_page/restaurants_overview.dart';
import 'package:itable_app/pages/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itable_app/pages/restaurants_fast_food_page/restaurants_fast_food.view.dart';
import 'package:itable_app/pages/restaurants_japanese_page/restaurants_japanese_view.dart';
import 'package:itable_app/pages/restaurants_mexican_page/restaurants_mexican_view.dart';
import 'package:itable_app/utils/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:itable_app/auth/auth.dart';

void main() {
  runApp(ProviderScope(child: ItableApp()));
}

class ItableApp extends ConsumerWidget {
  ItableApp({super.key});
  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return MaterialApp(
      theme: tema.copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(54, 80, 76, 76),
        textTheme: tema.textTheme.copyWith(
          titleLarge: TextStyle(
            fontFamily: GoogleFonts.raleway().fontFamily,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          titleMedium: TextStyle(
            fontFamily: GoogleFonts.raleway().fontFamily,
            fontSize: 15,
            color: const Color.fromARGB(255, 8, 8, 8),
          ),
          titleSmall: TextStyle(
            fontFamily: GoogleFonts.raleway().fontFamily,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        appBarTheme: tema.appBarTheme.copyWith(
          backgroundColor: const Color.fromARGB(54, 80, 76, 76),
          titleTextStyle: const TextStyle(
            fontFamily: 'Raleway',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME_PAGE: (ctx) => const WelcomeScreen(),
        AppRoutes.LOGIN: (ctx) => const AuthPage(),
        AppRoutes.RESTAURANTS_OVERVIEW: (ctx) => const RestaurantsOverview(),
        AppRoutes.RESTAURANTS_MEXICAN: (ctx) => const RestaurantsMexicanView(),
        AppRoutes.RESTAURANTS_FAST_FOOD: (ctx) =>
            const RestaurantsFastFoodView(),
        AppRoutes.RESTAURANTS_JAPANESE: (ctx) =>
            const RestaurantsJapaneseView(),
      },
    );
  }
}
