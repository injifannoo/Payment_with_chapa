import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class PaymentConfirmationScreen extends StatelessWidget {
  final double amount;
  final String email;
  final String phoneNumber;
  final String paymentUrl;
  final String transactionId;
  final double walletBalance;

  const PaymentConfirmationScreen({
    required this.amount,
    required this.email,
    required this.phoneNumber,
    required this.paymentUrl,
    required this.transactionId,
    required this.walletBalance,
  });

  Future<void> _launchPaymentUrl() async {
    final Uri url =
        Uri.parse(paymentUrl); // Convert the paymentUrl string to Uri
    // Check if the URL can be launched
    if (await canLaunchUrl(url)) {
      await launchUrl(url); // Launch the URL
    } else {
      // Show an error message if the URL cannot be launched
      print('Could not launch $paymentUrl');
      throw 'Could not launch $paymentUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Confirmation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Payment Successful',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            Text('Amount: $amount ETB', style: const TextStyle(fontSize: 16)),
            Text('Email: $email', style: const TextStyle(fontSize: 16)),
            Text('Phone Number: $phoneNumber',
                style: const TextStyle(fontSize: 16)),
            Text('Transaction ID: $transactionId',
                style: const TextStyle(fontSize: 16)),
            Text('Updated Wallet Balance: $walletBalance ETB',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold)), // Display updated wallet balance
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchPaymentUrl, // Redirect to the payment URL
              child: const Text('View Payment Details'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
