// explore_menu_page.dart
import 'package:flutter/material.dart';

class ExploreMenu {
  final String title;
  final String image;

  ExploreMenu({required this.title, required this.image});
}

// Sample data for the explore menu
List<ExploreMenu> exploreItems = [
  ExploreMenu(title: 'Duluti Restaurant', image: 'assets/duluti_restaurant.jpg'),
  ExploreMenu(title: 'Khans BBQ', image: 'assets/khans_bbq.jpg'),
  ExploreMenu(title: 'River Trees', image: 'assets/river_trees.jpg'),
  ExploreMenu(title: 'Five Chutneys', image: 'assets/five_chutneys.jpg'),
  // Add more items as needed
];

class ExploreMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Menu'),
        backgroundColor: const Color(0xFF3E2723), // Dark Chocolate
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/black_bg.jpg'), // Your background image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: ListView.builder(
          itemCount: exploreItems.length,
          itemBuilder: (context, index) {
            final item = exploreItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset(
                  item.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black, // Change text color for readability
                  ),
                ),
                onTap: () {
                  // Implement action when tapping on an item
                },
              ),
            );
          },
        ),
      ),
    );
  }
}