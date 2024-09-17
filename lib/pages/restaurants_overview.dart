import 'package:flutter/material.dart';

class RestaurantsOverview extends StatefulWidget {
  const RestaurantsOverview({super.key});

  @override
  State<RestaurantsOverview> createState() => _RestaurantsOverviewState();
}

class _RestaurantsOverviewState extends State<RestaurantsOverview> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Restaurants Overview', style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
