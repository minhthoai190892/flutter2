import 'package:fb_auth_bloc/blocs/auth/auth_bloc.dart';
import 'package:fb_auth_bloc/blocs/profile/profile_cubit.dart';
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
    final String uid = context.read<AuthBloc>().state.user!.uid;
    print(uid);
    // _getProfile();
  }

  void _getProfile() {
    final String uid = context.read<AuthBloc>().state.user!.uid;
    print('uid: $uid');
    context.read<ProfileCubit>().getProfile(uid: uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.error) {
            errorDialog(context, state.error);
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state.status == ProfileStatus.initial) {
            return Container();
          }
          if (state.status == ProfileStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status == ProfileStatus.error) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/error.png',
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Oooops!\nTry again',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ],
              ),
            );
          }
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: state.user.profileImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '-id: ${state.user.id}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '- name: ${state.user.name}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '- email: ${state.user.email}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '- point: ${state.user.point}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '- rank: ${state.user.rank}',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
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
