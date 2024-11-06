import 'package:flutter/material.dart';
import 'package:itable_app/widgets/category_card.dart';
import 'package:itable_app/widgets/section_title.dart';
import 'package:itable_app/widgets/menu_card.dart';

class RestaurantsOverview extends StatelessWidget {
  const RestaurantsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
        ),
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Dishes, restaurants, or cuisines',
            hintStyle: TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Colors.grey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SectionTitle(title: 'Popular categories'),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(icon: Icons.local_pizza, color: Colors.pink),
                  CategoryCard(icon: Icons.icecream, color: Colors.blue),
                  CategoryCard(icon: Icons.fastfood, color: Colors.green),
                ],
              ),
            ),
            const SectionTitle(title: "Today's special menu"),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  MenuCard(
                    title: 'The Taco Company',
                    rating: 4.8,
                    cuisine: 'Mexican',
                    icon: Icons.fastfood,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 8),
                  MenuCard(
                    title: 'The Burguer Club',
                    rating: 5.0,
                    cuisine: 'American',
                    icon: Icons.local_drink,
                    color: Colors.purple,
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
            const SectionTitle(title: 'Featured restaurants'),
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(
                  Icons.food_bank,
                  size: 80,
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
