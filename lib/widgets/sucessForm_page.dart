import 'package:flutter/material.dart';
import 'package:itable_app/utils/app_routes.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem no topo
            Expanded(
              child: Image.asset(
                'assets/images/sucess_image.png', // Substitua pelo caminho correto da sua imagem
                fit: BoxFit.contain,
              ),
            ),

            const Text(
              'Muito Obrigado!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Mensagem de sucesso
            const Text(
              'Seu agendamento foi realizado com sucesso.\n\n'
              'Será necessário apresentar seu documento com foto '
              'na recepção para confirmação do seu agendamento.\n\n'
              'Agradecemos pela sua preferência.',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Botão para voltar à Home
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      AppRoutes
                          .RESTAURANTS_OVERVIEW); // Navega para a tela anterior
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Voltar ao início',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
