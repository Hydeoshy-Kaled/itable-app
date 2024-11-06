import 'package:flutter/material.dart';
import 'package:itable_app/auth/auth_app_engine.dart';

class RestaurantsOverview extends StatefulWidget {
  const RestaurantsOverview({super.key});

  @override
  State<RestaurantsOverview> createState() => _RestaurantsOverviewState();
}

class _RestaurantsOverviewState extends State<RestaurantsOverview> {
  final AuthAppEngine authAppEngine = AuthAppEngine();
  String responseText = 'Carregando...';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final response = await authAppEngine.fetchData('/tables');
      if (mounted) {
        setState(() {
          responseText = response.data.toString();
        });
      }
    } catch (e) {
      setState(() {
        responseText = 'Erro ao carregar dados: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurantes'),
      ),
      body: Center(
        child: Text(
          responseText,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
