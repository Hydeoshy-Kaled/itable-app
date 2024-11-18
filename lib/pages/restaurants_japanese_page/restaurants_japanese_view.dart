import 'package:flutter/material.dart';
import 'package:itable_app/utils/app_routes.dart';
import 'package:itable_app/widgets/button_restaurants.dart';
import 'package:itable_app/widgets/categoryFood_card.dart';

class RestaurantsJapaneseView extends StatelessWidget {
  const RestaurantsJapaneseView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'name': 'Japanese Special',
        'price': '\$30',
        'icon': 'assets/images/food_japanese.png',
        'color': Colors.red
      },
      {
        'name': 'Sushi',
        'price': '\$12',
        'icon': 'assets/images/sushi.png',
        'color': Colors.orange
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
                  'Restaurants > Takeaway\nJapanese',
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
                  height: 210,
                  width: 343,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/person_japanese.png'),
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
                      AppRoutes.BOOKING_FORM,
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
