// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/assistant_method/address_changer.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/main_screen/save_address_screen.dart';
import 'package:foodpanda_users_app/models/address_model.dart';
import 'package:foodpanda_users_app/widgets/address_design_widget.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({
    Key? key,
    required this.totalAmount,
    required this.sellerId,
  }) : super(key: key);
  final double totalAmount;
  final String sellerId;

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        automaticallyImplyLeading: true,
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
        title: const Text(
          'iFood',
          style: TextStyle(
            fontSize: 60,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Select Address: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Consumer<AddressChanger>(
            builder: (context, address, child) {
              return Flexible(
                  child: StreamBuilder(
                stream: firebaseFirestore
                    .collection('users')
                    .doc(firebaseAuth.currentUser!.uid)
                    .collection('userAddresss')
                    .snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : snapshot.data!.docs.isEmpty
                          ? Container()
                          : ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                print(
                                    "addressId: ${snapshot.data!.docs[index].id}");
                                return AddressDesignWidget(
                                  model: AddressModel.fromMap(
                                      snapshot.data!.docs[index].data()),
                                  currentIndex: address.count,
                                  value: index,
                                  addressId: snapshot.data!.docs[index].id,
                                  totalAmount: widget.totalAmount,
                                  selleruID: widget.sellerId,
                                );
                              },
                            );
                },
              ));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // add address
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaveAddressScreen(),
              ));
        },
        icon: const Icon(
          Icons.add_location,
          color: Colors.white,
        ),
        backgroundColor: Colors.cyan,
        label: const Text(
          'Add New Address',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
