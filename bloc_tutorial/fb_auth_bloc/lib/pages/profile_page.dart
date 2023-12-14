
import 'package:fb_auth_bloc/utils/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  void _getProfile() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Card(
        child: Column(
          children: [
            //   FadeInImage.assetNetwork(
            //   placeholder: 'assets/images/loading.gif',
            //   image: state.user.profileImage,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // )

            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '-id: ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '- name: ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '- name: ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '- point:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '- rank: ',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


  //  Card(
  //   child: Column(
  //     mainAxisSize: MainAxisSize.min,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       FadeInImage.assetNetwork(
  //         placeholder: 'assets/images/loading.gif',
  //         image: state.user.profileImage,
  //         width: double.infinity,
  //         fit: BoxFit.cover,
  //       ),
  //       SizedBox(height: 10.0),
  //       Padding(
  //         padding: const EdgeInsets.only(left: 15.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               '-id: ',
  //               style: TextStyle(fontSize: 18.0),
  //             ),
  //             SizedBox(height: 10.0),
  //             Text(
  //               '- name: ',
  //               style: TextStyle(fontSize: 18.0),
  //             ),
  //             SizedBox(height: 10.0),
  //             Text(
  //               '- email:.0),
  //             ),
  //             SizedBox(height: 10.0),
  //             Text(
  //               '- point:',
  //               style: TextStyle(fontSize: 18.0),
  //             ),
  //             SizedBox(height: 10.0),
  //             Text(
  //               '- rank: ',
  //               style: TextStyle(fontSize: 18.0),
  //             ),
  //           ],
  //         ),
  //       )
  //     ],
  //   ),
  // )

// Center(
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Image.asset(
  //         'assets/images/error.png',
  //         width: 75,
  //         height: 75,
  //         fit: BoxFit.cover,
  //       ),
  //       SizedBox(width: 20.0),
  //       Text(
  //         'Ooops!\nTry again',
  //         textAlign: TextAlign.center,
  //         style: TextStyle(
  //           fontSize: 20.0,
  //           color: Colors.red,
  //         ),
  //       ),
  //     ],
  //   ),
  // );
