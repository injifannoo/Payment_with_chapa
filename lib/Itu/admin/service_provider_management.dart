// service_provider_management.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hellobalemoya_app/Itu/models/service_provider.dart';

class ServiceProviderManagementScreen extends StatelessWidget {
  final List<ServiceProvider> providers = [
    ServiceProvider(
      name: 'John Doe',
      email: 'john@example.com',
      walletBalance: 700.0,
      id: '',
    ),
    ServiceProvider(
      name: 'Jane Doe',
      email: 'jane@example.com',
      walletBalance: 600.0,
      id: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage Service Providers')),
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (context, index) {
          final provider = providers[index];
          return ListTile(
            title: Text(provider.name),
            subtitle: Text('Balance: ${provider.walletBalance} ETB'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Navigate to edit provider screen
              },
            ),
          );
        },
      ),
    );
  }
}
