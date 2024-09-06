// explore_page.dart
import 'package:flutter/material.dart';
import 'explore_menu_page.dart'; // Import the explore menu data
import 'login_page.dart'; // Import the LoginPage

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: const Color(0xFF3E2723), // Dark Chocolate
        actions: [
          IconButton(
            icon: const Icon(Icons.logout), // Sign out icon
            onPressed: () {
              // Navigate back to the LoginPage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/black_bg.jpg'), // Your background image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: ListView.builder(
          itemCount: exploreItems.length, // Use the length of the explore items
          itemBuilder: (context, index) {
            final item = exploreItems[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: Image.asset(
                  item.image, // Use the image from the explore item
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Change text color for readability
                  ),
                ),
                onTap: () {
                  // Implement action when tapping on an item
                  // For example, navigate to a detail page
                },
              ),
            );
          },
        ),
      ),
    );
  }
}