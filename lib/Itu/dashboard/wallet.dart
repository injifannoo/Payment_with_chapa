// import 'package:flutter/material.dart';
// import 'package:hellobalemoya_app/Itu/services/wallet_service.dart';

// class WalletScreen extends StatelessWidget {
//   final WalletService walletService = WalletService();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Wallet')),
//       body: Center(
//         child: Column(
//           children: [
//             Text('Balance: ${walletService.balance} ETB'),
//             ElevatedButton(
//               onPressed: () async {
//                 await walletService.deposit(100.0);
//                 // Update UI accordingly
//               },
//               child: Text('Deposit 100 ETB'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
