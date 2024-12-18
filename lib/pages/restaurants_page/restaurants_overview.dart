import 'package:flutter/material.dart';
import 'package:itable_app/pages/restaurants_page/bookings/bookings_screen_navigation_view.dart';

import 'package:itable_app/utils/app_routes.dart';
import 'package:itable_app/widgets/CustomDrawer.dart';
import 'package:itable_app/widgets/category_card.dart';
import 'package:itable_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:itable_app/widgets/section_title.dart';
import 'package:itable_app/widgets/menu_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RestaurantsOverview extends StatefulWidget {
  const RestaurantsOverview({super.key});

  @override
  State<RestaurantsOverview> createState() => _RestaurantsOverviewState();
}

class _RestaurantsOverviewState extends State<RestaurantsOverview> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const RestaurantsOverviewContent(),
    const BookingsScreenNavigationView(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<String> allItems = [
    'The Taco Company',
    'The Burger Club',
  ];

  List<String> filteredItems = [];

  void _onSearchChanged(String value) {
    setState(() {
      filteredItems = allItems
          .where((item) => item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(allItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
          ),
        ),
      ),
      drawer: const CustomDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

class RestaurantsOverviewContent extends StatelessWidget {
  const RestaurantsOverviewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SectionTitle(title: 'Popular categories'),
          SizedBox(
            height: 80,
            child: Align(
              alignment: Alignment.center,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  CategoryCard(
                      icon: Icons.local_pizza,
                      color: Colors.pink,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.CATEGORIES_FAST_FOOD,
                        );
                      }),
                  const SizedBox(width: 16),
                  CategoryCard(
                    icon: Icons.soup_kitchen,
                    color: Colors.blue,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.CATEGORIES_MEXICAN);
                    },
                  ),
                  const SizedBox(width: 16),
                  CategoryCard(
                    icon: MdiIcons.rice,
                    color: Colors.green,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.CATEGORIES_JAPANESE);
                    },
                  ),
                ],
              ),
            ),
          ),
          const SectionTitle(title: "Today's special menu"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 16),
                MenuCard(
                  title: 'Taco Loco',
                  rating: 4.8,
                  cuisine: 'Mexican',
                  imagePath: 'assets/images/tacos.png',
                  color: const Color(0xFFF5D4C1),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.RESTAURANTS_MEXICAN,
                    );
                  },
                ),
                const SizedBox(width: 8),
                MenuCard(
                  title: 'Burguer',
                  rating: 5.0,
                  cuisine: 'American',
                  imagePath: 'assets/images/burguer.png',
                  color: const Color(0xFFFFEBEE),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.RESTAURANTS_FAST_FOOD,
                    );
                  },
                ),
                const SizedBox(width: 8),
                MenuCard(
                  title: 'Lamen',
                  rating: 5.0,
                  cuisine: 'Japanese',
                  imagePath: 'assets/images/lamen.png',
                  color: const Color(0xFFFFEBEE),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.RESTAURANTS_JAPANESE,
                    );
                  },
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          const SectionTitle(title: 'Featured restaurants'),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.RESTAURANTS_FAST_FOOD,
              );
            },
            child: Container(
              height: 200,
              width: 343,
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The Burguer Club',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Image(
                    image: AssetImage('assets/images/chicken.png'),
                    width: 327,
                    height: 147,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.RESTAURANTS_JAPANESE,
              );
            },
            child: Container(
              height: 200,
              width: 343,
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sakura Sabor',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Image(
                    image: AssetImage('assets/images/lamen.png'),
                    width: 327,
                    height: 147,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.RESTAURANTS_MEXICAN,
              );
            },
            child: Container(
              height: 200,
              width: 343,
              decoration: BoxDecoration(
                color: Colors.orange[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The Taco Company',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Image(
                    image: AssetImage('assets/images/tacos.png'),
                    width: 327,
                    height: 147,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
