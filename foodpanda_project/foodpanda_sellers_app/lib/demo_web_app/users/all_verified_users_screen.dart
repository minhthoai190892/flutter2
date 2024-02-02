import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/widgets/simple_app_bar_widget.dart';

class AllVeriedUsersScreen extends StatefulWidget {
  const AllVeriedUsersScreen({super.key});

  @override
  State<AllVeriedUsersScreen> createState() => _AllVeriedUsersScreenState();
}

class _AllVeriedUsersScreenState extends State<AllVeriedUsersScreen> {
  QuerySnapshot? allUsers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('users')
        .where('status', isEqualTo: 'approved')
        .get()
        .then((value) {
      setState(() {
        allUsers = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'All Verified Users Account'),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: allUsers != null
              ? ListView.builder(
                  itemCount: allUsers!.docs.length,
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
                                    allUsers!.docs[index].get('userAvatarurl'),
                                  ),
                                ),
                              ),
                            ),
                            title: Text(
                              allUsers!.docs[index].get('userName'),
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
                                  allUsers!.docs[index].get('userEmail'),
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
                              onPressed: () {},
                              icon: const Icon(Icons.person_pin_sharp,color: Colors.white,),
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
