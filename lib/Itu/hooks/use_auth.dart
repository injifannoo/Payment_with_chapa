// use_auth.dart
import 'package:flutter/material.dart';

class AuthService {
  bool isAuthenticated = false;

  Future<void> login(String email, String password) async {
    // Mocking backend response
    await Future.delayed(Duration(seconds: 2));
    isAuthenticated = true; // Assuming login success
  }

  Future<void> logout() async {
    isAuthenticated = false;
  }
}

// login.dart