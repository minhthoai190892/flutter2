import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/services/http_util.dart';

import 'common/routes/routes.dart';
import 'common/utils/app_style.dart';
import 'global.dart';

Future<void> main() async {
  await Global().init();
  // var item =
  //     Global.storageService.getString(AppConstants.STORAGE_USER_PROFILE_KEY);
  // print(item.length);
  // var newItem = jsonDecode(item);
  // print(newItem);
  HttpUtil().post('api/login',queryParameters: {
    'name' :"test",
    'email' :"a@a.com",
    'avatar' :"xyz",
    'open_id':"uisiueihxxsasdqw",
    'type':2
  });
  runApp(const ProviderScope(child: MyApp()));
}
// shldjfhs

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        title: 'Clearning Flutter',
        navigatorKey: navKey,
        theme: AppTheme.appThemeData,
        // initialRoute: '/',
        // routes: routesMap,
        // home: const Welcome(),
        onGenerateRoute: (settings) => AppPages.generateRouteSettings(settings),
      ),
    );
  }
}

// quản lý state
final appCount = StateProvider<int>((ref) => 1);

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'River app',
            ),
            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'one',
            onPressed: () => ref.read(appCount.notifier).state++,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'two',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ));
            },
            child: const Icon(Icons.arrow_right_alt_rounded),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
