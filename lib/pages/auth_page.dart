import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itable_app/widgets/auth_form.dart';
import 'package:itable_app/providers/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final authMode = ref.watch(authStateProvider);
    return Scaffold(
      //resizeToAvoidBottomInset: true,
        body: SizedBox(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: Image.asset('assets/images/Icone Itable.png'),
            ),
            SizedBox(
              //padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Center(
                child: 
                Text(
                  authMode == AuthMode.Login ?
                  'Faça seu login para continuar!' :
                  'Realize seu cadastro para continuar!',
                  style: TextStyle(
                    fontFamily: GoogleFonts.raleway().fontFamily,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const AuthForm(),
          ],
        ),
      ),
    ));
    //sizedbox(height: 16),
  }
}
