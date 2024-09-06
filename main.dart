// main.dart
import 'package:flutter/material.dart';
import 'login_page.dart'; // Import the LoginPage
import 'signup_page.dart'; // Import the SignupPage
import 'explore_menu_page.dart'; // Import the ExploreMenuPage

void main() {
  runApp(const RestaurantHubApp());
}

class RestaurantHubApp extends StatelessWidget {
  const RestaurantHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Restaurant Hub',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Restaurant Hub',
          style: TextStyle(
            color: Color(0xFFFFDD00), // Cream color
            fontFamily: 'Arial', // Change to your desired font family
            fontSize: 24, // Font size
            fontWeight: FontWeight.bold, // Bold font weight
          ),
        ),
        backgroundColor: const Color(0xFF3E2723), // Dark Chocolate
        actions: [
          TextButton(
            onPressed: () {
              // Navigate to Sign Up page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            child: const Text(
              'Sign Up',
              style: TextStyle(
                color: Color.fromARGB(255, 83, 253, 4),
                fontSize: 20,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigate to Log In page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: const Text(
              'Log In',
              style: TextStyle(
                color: Color.fromARGB(255, 83, 253, 4),
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background image of black background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/black_bg.jpg'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay for text readability
          Container(
            color: const Color(0x80000000), // Black overlay
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'The Restaurant Hub',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFDD00), // Cream
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Explore Menu page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExploreMenuPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF556B2F), // Olive Green
                    foregroundColor: const Color(0xFFFFDD00), // Cream
                  ),
                  child: const Text('Explore the Menu'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}