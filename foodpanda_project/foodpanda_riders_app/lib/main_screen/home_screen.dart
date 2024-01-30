import 'package:flutter/material.dart';
import 'package:foodpanda_riders_app/global/global.dart';
import 'package:foodpanda_riders_app/main_screen/history_screen.dart';
import 'package:foodpanda_riders_app/main_screen/new_orders_screen.dart';
import 'package:foodpanda_riders_app/main_screen/not_yet_delivered_screen.dart';
import 'package:foodpanda_riders_app/main_screen/parcel_in_progress_screen.dart';

import '../assistant_method/get_current_user_location.dart';
import '../authentication/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Card makeDashboardItem(String title, IconData iconData, int index) => Card(
        elevation: 2,
        margin: const EdgeInsets.all(8),
        child: Container(
          decoration: index == 0 || index == 3 || index == 4
              ? const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.cyan,
                      Colors.amber,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.mirror,
                  ),
                )
              : const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.redAccent,
                      Colors.amber,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.mirror,
                  ),
                ),
          child: InkWell(
            onTap: () {
              if (index == 0) {
                // New available Orders
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewOrdersScreen(),
                    ));
              }
              if (index == 1) {
                // Parcels in Progress
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ParcelInProgressScreen(),
                    ));
              }
              if (index == 2) {
                // Not yet Delivered
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotYetDeliveredScreen(),
                    ));
              }
              if (index == 3) {
                print(index);
                // History
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryScreen(),
                    ));
              }
              if (index == 4) {
                // Total Earning
              }
              if (index == 5) {
                // Logout
                firebaseAuth.signOut().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    )));
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: [
                Center(
                  child: Icon(
                    iconData,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetCurrentUserLocation.determinePosition();
    getPerParcelDeliverAmount();
    getRiderPreviousEarnings();
  }

  getRiderPreviousEarnings() {
    firebaseFirestore
        .collection('riders')
        .doc(sharedPreferences!.getString('uid'))
        .get()
        .then((value) {
      previousRiderEarnings = value.data()!['earnings'].toString();
    });
  }

  getPerParcelDeliverAmount() {
    firebaseFirestore
        .collection('perDeliver')
        .doc('Qxpfes23ZBlpbTkUtsBU')
        .get()
        .then((value) {
      perParcelDeliveryAmount = value.data()!['amount'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        backgroundColor: Colors.blue,
        title: Text(
          'Welcome: ${sharedPreferences!.getString('name')!}',
          style: const TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontFamily: 'Signatra',
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 50),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(2),
          children: [
            makeDashboardItem('New Available', Icons.assignment, 0),
            makeDashboardItem('Parcels in Progress', Icons.airport_shuttle, 1),
            makeDashboardItem('Not Yet Delivered', Icons.location_history, 2),
            makeDashboardItem('History', Icons.done_all, 3),
            makeDashboardItem('Total Earnings', Icons.monetization_on, 4),
            makeDashboardItem('Logout', Icons.logout, 5),
          ],
        ),
      ),
    );
  }
}
