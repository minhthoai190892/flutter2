import 'package:flutter/material.dart';
import 'package:foodpanda_riders_app/global/global.dart';
import 'package:foodpanda_riders_app/splash_screen/splash_screen.dart';
import 'package:foodpanda_riders_app/widgets/simple_app_bar_widget.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(previousEarnings);
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Earning ',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$ $previousRiderEarnings",
              style: const TextStyle(
                  color: Colors.black, fontSize: 80, fontFamily: 'Signatra'),
            ),
            const Text(
              'Total Earnings',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 200,
              child: Divider(
                thickness: 1.5,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MySplashScreen(),
                    ));
              },
              child: const Card(
                color: Colors.blueGrey,
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 140),
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Back',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
