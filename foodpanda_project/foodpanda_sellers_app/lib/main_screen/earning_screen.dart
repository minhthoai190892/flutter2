import 'package:flutter/material.dart';

import '../global/global.dart';
import '../splash_screen/splash_screen.dart';
import '../widgets/simple_app_bar_widget.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  double sellerTotalEarning = 0.0;
  retrievSellerEarning() async {
    await firebaseFirestore
        .collection('sellers')
        .doc(sharedPreferences!.getString('uid'))
        .get()
        .then((value) {
      setState(() {
        sellerTotalEarning = double.parse(value.data()!['earnings'].toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    retrievSellerEarning();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      appBar: const SimpleAppBar(
        title: 'Earning ',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$ $sellerTotalEarning",
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
              child: Card(
                color: Colors.blueGrey,
                margin: EdgeInsets.symmetric(
                    vertical: 40, horizontal: size.width * 0.33),
                child: const ListTile(
                  leading: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  title: Center(
                    child: Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
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
