import 'package:flutter/material.dart';

import '../widgets/app_widget.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Wallet',
                style: AppWidget.headlineTextFeildStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
