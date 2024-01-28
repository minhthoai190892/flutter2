// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_riders_app/global/global.dart';
import 'package:foodpanda_riders_app/maps/map_utils.dart';

class ShipmentScreen extends StatefulWidget {
  const ShipmentScreen({
    Key? key,
    required this.purchaserId,
    required this.purchaserAddress,
    required this.sellerId,
    required this.getOrderId,
    required this.purchaserLat,
    required this.purchaserLng,
  }) : super(key: key);
  final String purchaserId;
  final String purchaserAddress;
  final String sellerId;
  final String getOrderId;
  final double purchaserLat;
  final double purchaserLng;

  @override
  State<ShipmentScreen> createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {
  double? sellerLat, sellerLng;
  getData() async {
    firebaseFirestore
        .collection('sellers')
        .doc(widget.sellerId)
        .get()
        .then((value) {
      sellerLat = value.data()!['lat'];
      sellerLng = value.data()!['lng'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipment Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/confirm1.png'),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              // show current Cafe/Restaurant Location
              MapUtils.lauchMapFromSourceToDestination(
                  sourceLat: position!.latitude,
                  sourceLng: position!.longitude,
                  destinationLat: sellerLat,
                  destinationLng: sellerLng);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/restaurant.png',
                  width: 50,
                ),
                const SizedBox(
                  width: 7,
                ),
                const Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Show Cafe/Restaurant Location',
                      style: TextStyle(
                        fontFamily: 'Signatra',
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              // confirmed - that riders has picked parcel from seller
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
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
              child: const Center(
                child: Text(
                  'Order has been Picked - Confirmed',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
