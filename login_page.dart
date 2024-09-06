// login_page.dart
import 'package:flutter/material.dart';
import 'signup_page.dart'; // Import the SignupPage
import 'user_model.dart'; // Import UserModel for authentication
import 'user_home_page.dart'; // Import the User Home Page

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // To toggle password visibility
  FocusNode _emailFocusNode = FocusNode(); // Focus node for the email field

  void _handleLogin(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Check if user exists and if the password matches
    bool success = await UserModel.login(email, password);

    if (success) {
      // Navigate to the user home page after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserHomePage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );
    } else {
      // Show an error message and request focus on the email field
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
      _emailFocusNode.requestFocus(); // Focus back on the email field
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose(); // Dispose of the focus node
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        backgroundColor: const Color(0xFF3E2723), // Dark Chocolate
      ),
      body: Stack(
        children: [
          // Background image of coffee chat
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_chat.jpg'), // Background image
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
            child: SingleChildScrollView(
              child: Container(
                width: 500, // Set the maximum width of the form
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: const Color(0xFFF5F5DC), // Light beige color
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _emailController,
                          focusNode: _emailFocusNode, // Assign the focus node
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onSubmitted: (_) => _handleLogin(context), // Submit on Enter
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_isPasswordVisible, // Toggle visibility
                          onSubmitted: (_) => _handleLogin(context), // Submit on Enter
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => _handleLogin(context),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: const Color(0xFF556B2F), // Olive Green
                            foregroundColor: const Color(0xFFFFDD00), // Cream
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ), // Handle button press
                          child: const Text('Log In'),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("You haven't registered yet? "),
                            TextButton(
                              onPressed: () {
                                // Navigate to the signup page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignupPage()),
                                );
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(color: Color(0xFF556B2F)), // Olive Green
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}