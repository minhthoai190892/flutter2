import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/widgets/simple_app_bar_widget.dart';

class AllVeriedRidersScreen extends StatefulWidget {
  const AllVeriedRidersScreen({super.key});

  @override
  State<AllVeriedRidersScreen> createState() => _AllVeriedRidersScreenState();
}

class _AllVeriedRidersScreenState extends State<AllVeriedRidersScreen> {
  QuerySnapshot? allriders;
  displayDialogBoxForBlockingAccount(riderDocumentId) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(
            'Block Account',
            style: TextStyle(
              fontSize: 25,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Do you want to block this account',
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
                Map<String, dynamic> riderDataMap = {
                  'status': 'not approved',
                };
                FirebaseFirestore.instance
                    .collection('riders')
                    .doc(riderDocumentId)
                    .update(riderDataMap)
                    .then((value) {
                  const snackBar = SnackBar(
                    backgroundColor: Colors.pinkAccent,
                    duration: Duration(seconds: 2),
                    content: Text(
                      'Block Successfully',
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
        .collection('riders')
        .where('status', isEqualTo: 'approved')
        .get()
        .then((value) {
      setState(() {
        allriders = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'All Verified riders Account'),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: allriders != null
              ? ListView.builder(
                  itemCount: allriders!.docs.length,
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
                                    allriders!.docs[index].get('riderAvatarurl'),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              allriders!.docs[index].get('riderName'),
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
                                  allriders!.docs[index].get('riderEmail'),
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
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                displayDialogBoxForBlockingAccount(
                                    allriders!.docs[index].id);
                              },
                              icon: const Icon(
                                Icons.person_pin_sharp,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Block this account'.toUpperCase(),
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
