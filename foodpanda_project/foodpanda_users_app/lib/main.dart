import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/assistant_method/cart_item_counter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'global/global.dart';
import 'splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartItemCounter(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Riders App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MySplashScreen(),
      ),
    );
  }
}
