// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class ChapaService {
  final String baseUrl = 'https://api.chapa.co/v1'; // Correct base URL
  final String apiKey =
      'CHASECK_TEST-O7n7AHxy8HOXhLwxKUuxpGT7PMPSbgtb'; // Your Chapa API key
  final String backendBaseUrl = 'http://192.168.43.19:3000';

  Future<Map<String, dynamic>> createPayment({
    required double amount,
    required String email,
    required String phoneNumber,
    required String description,
  }) async {
    if (email.isEmpty || phoneNumber.isEmpty || description.isEmpty) {
      throw ArgumentError(
          'Email, phoneNumber, and description must not be empty.');
    }
    final String txRef =
        const Uuid().v4(); // Generate a unique transaction reference

    final url =
        Uri.parse('$baseUrl/transaction/initialize'); // Updated endpoint
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'amount': amount,
        'currency': 'ETB',
        'tx_ref': txRef,
        'email': email,
        'phone': phoneNumber,
        'description': description,
        'callback_url': '$backendBaseUrl/callback' // Your server's callback URL
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to create payment:${response.reasonPhrase}');
    }
  }

  Future<Map<String, dynamic>> getUserWallet(String email) async {
    final url = Uri.parse('$backendBaseUrl/wallet/$email');
    final response = await http.get(url);
    print('The response ${response.body} and $url from getUserWallet method');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch wallet data');
    }
  }

  Future<Map<String, dynamic>> deductCommission(String email) async {
    final url = Uri.parse('$backendBaseUrl/deduct-commission');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to deduct commission');
    }
  }
}
