// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../main_screen/home_screen.dart';

class StatusBannerWidget extends StatelessWidget {
  const StatusBannerWidget({
    Key? key,
    required this.status,
    required this.orderStatus,
  }) : super(key: key);
  final bool status;
  final String orderStatus;
  @override
  Widget build(BuildContext context) {
    Icon icon = status
        ? const Icon(
            Icons.done,
            color: Colors.white,
            size: 14,
          )
        : const Icon(
            Icons.cancel,
            color: Colors.white,
            size: 14,
          );
    String message = status ? 'Success' : 'Unsuccess';

    return Container(
      height: 60,
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
      child: Center(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              orderStatus == 'ended'
                  ? "Parcel Devlivered $message"
                  : "Order Devlivered $message",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 8,
              backgroundColor: Colors.grey,
              child: Center(
                child: icon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
