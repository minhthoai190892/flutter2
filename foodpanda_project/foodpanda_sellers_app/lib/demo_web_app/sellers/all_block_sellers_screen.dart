import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/widgets/simple_app_bar_widget.dart';

class AllBlockSellersScreen extends StatefulWidget {
  const AllBlockSellersScreen({super.key});

  @override
  State<AllBlockSellersScreen> createState() => _AllBlockSellersScreenState();
}

class _AllBlockSellersScreenState extends State<AllBlockSellersScreen> {
  QuerySnapshot? allsellers;
  displayDialogActivingAccount(sellerDocumentId) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Active Account',
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Do you want to active this account',
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> sellerDataMap = {
                  'status': 'approved',
                };
                FirebaseFirestore.instance
                    .collection('sellers')
                    .doc(sellerDocumentId)
                    .update(sellerDataMap)
                    .then((value) {
                  const snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                    content: Text(
                      ' Active Successfully',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.black,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                });
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('sellers')
        .where('status', isEqualTo: 'not approved')
        .get()
        .then((value) {
      setState(() {
        allsellers = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'All Active sellers Account'),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: allsellers != null
              ? ListView.builder(
                  itemCount: allsellers!.docs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    allsellers!.docs[index].get('sellerAvatarUrl'),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              allsellers!.docs[index].get('sellerName'),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  allsellers!.docs[index].get('sellerEmail'),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                displayDialogActivingAccount(
                                    allsellers!.docs[index].id);
                              },
                              icon: const Icon(
                                Icons.person_pin_sharp,
                                color: Colors.white,
                              ),
                              label: Text(
                                ' Active this account'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 15,
                                    letterSpacing: 3,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'No record found',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
