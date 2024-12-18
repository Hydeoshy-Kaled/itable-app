import 'package:flutter/material.dart';
import 'package:itable_app/utils/app_routes.dart';
import 'package:itable_app/widgets/button_restaurants.dart';
import 'package:itable_app/widgets/categoryFood_card.dart';

class RestaurantsFastFoodView extends StatelessWidget {
  const RestaurantsFastFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Pizza',
        'price': '\$6',
        'icon': 'assets/images/icon_pizza.png',
        'color': Colors.red
      },
      {
        'name': 'Burguer',
        'price': '\$12',
        'icon': 'assets/images/burguer.png',
        'color': Colors.orange
      },
      {
        'name': 'Chicken Burger',
        'price': '\$9',
        'icon': 'assets/images/burguer.png',
        'color': Colors.green
      },
      {
        'name': 'Chicken Wings',
        'price': '\$10',
        'icon': 'assets/images/chicken.png',
        'color': Colors.blue
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_food.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Restaurants > Takeaway\nFast Food',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 300,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/puppet_image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];

                      return CategoryFoodCard(
                        name: category['name'] as String,
                        price: category['price'] as String,
                        icon: category['icon'] as String,
                        color: category['color'] as Color,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ButtonRestaurants(
                  text: 'Reserve agora',
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.RESERVATION_FORM,
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
