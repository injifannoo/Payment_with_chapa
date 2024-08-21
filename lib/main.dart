import 'package:hellobalemoya_app/Itu/screen/payment_screen.dart';
import 'package:flutter/material.dart';

import 'Itu/screen/wallet_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp((const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'payment screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WalletPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
