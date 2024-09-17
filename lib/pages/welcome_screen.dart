import 'package:flutter/material.dart';
import 'package:itable_app/widgets/button_home.dart';
import 'package:itable_app/utils/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Seus restaurantes favoritos estão aqui!',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Center(
                child: Text(
                  'Encontre os melhores restaurantes da sua cidade e reserve sua mesa, evitando longas esperas para desfrutar de uma ótima refeição.',
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 400,
                height: 468,
                child: Image.asset('assets/images/home_page.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: ButtonHome(
                text: 'Reserve agora!',
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(
                    AppRoutes.LOGIN,
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
