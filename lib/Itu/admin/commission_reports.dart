// commission_reports.dart
import 'package:flutter/material.dart';
import 'package:hellobalemoya_app/Itu/models/transaction.dart';
import 'package:hellobalemoya_app/Itu/services/wallet_service.dart';

class CommissionReportsScreen extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: '1',
        type: TransactionType.commission,
        amount: 50,
        date: DateTime.parse('2024-08-17')),
    Transaction(
        id: '2',
        type: TransactionType.commission,
        amount: 50,
        date: DateTime.parse('2024-08-17')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Commission Reports')),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text('Commission of ${transaction.amount} ETB'),
            subtitle: Text('Date: ${transaction.date}'),
          );
        },
      ),
    );
  }
}
