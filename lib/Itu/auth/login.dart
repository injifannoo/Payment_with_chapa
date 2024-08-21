import 'package:flutter/material.dart';
import 'package:hellobalemoya_app/Itu/hooks/use_auth.dart';

class LoginScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await authService.login('test@example.com', 'password');
            if (authService.isAuthenticated) {
              Navigator.pushReplacementNamed(context, '/dashboard');
            }
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
