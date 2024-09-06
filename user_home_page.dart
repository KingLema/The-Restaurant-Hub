// user_home_page.dart
import 'package:flutter/material.dart';
import 'explore_menu_page.dart'; // Import the ExploreMenuPage

class UserHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/black_bg.jpg'), // Your background image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to the Restaurant Hub! You can now explore more and different features in our web!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white, // Change text color for readability
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExploreMenuPage()), // Navigate to Explore Menu Page
                  );
                },
                child: const Text('Explore'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: const Color(0xFF556B2F), // Olive Green
                  foregroundColor: const Color(0xFFFFDD00), // Cream
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}