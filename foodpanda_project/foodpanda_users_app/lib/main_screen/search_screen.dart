import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/models/sellers_model.dart';
import 'package:foodpanda_users_app/widgets/sellers_design_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<QuerySnapshot>? restaurantsDocumentsList;
  String sellerNameText = '';
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
        title: TextField(
          onChanged: (value) {
            setState(() {
              sellerNameText = value;
            });
            initSearchingRestaurant(value);
          },
          decoration: InputDecoration(
            hintText: 'Search Restaurants',
            hintStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () {
                initSearchingRestaurant(sellerNameText);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: restaurantsDocumentsList,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    SellersModel sellersModel = SellersModel.fromMap(
                        snapshot.data!.docs[index].data()
                            as Map<String, dynamic>);
                    return SellersDesignWidget(
                      context: context,
                      model: sellersModel,
                    );
                  },
                )
              : const Center(
                  child: Text('No Record Found...'),
                );
        },
      ),
    );
  }

  void initSearchingRestaurant(String value) async {
    restaurantsDocumentsList = firebaseFirestore
        .collection('sellers')
        .where('sellerName', isGreaterThanOrEqualTo: value)
        .get();
  }
}
