// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ulearning_app/common/routes/app_route_name.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/sign_up/sign_up.dart';

import 'package:ulearning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<RouteEntity> routes() {
    return [
      RouteEntity(path: AppRoutesNames.WELCOME, page: const Welcome()),
      RouteEntity(path: AppRoutesNames.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutesNames.REGISTER, page: const SignUp()),
      RouteEntity(path: AppRoutesNames.APPLICATION, page: const Application()),
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    print('click route is ... ${settings.name}');
    if (settings.name != null) {
      /// lộc giá trị
      var result = routes().where((element) => element.path == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        print('deviceFirstTime:  $deviceFirstTime');
        //Throws a [StateError] if this is empty. Otherwise returns the first element in the iteration order, equivalent to this.elementAt(0).
        if (result.first.path == AppRoutesNames.WELCOME && deviceFirstTime) {
          print('on welcom route: ${result.first.path}');
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        } else {
          print('App ran frist time');
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => result.first.page,//=> welcomePage()
          );
        }
      }
    }
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const Welcome(),
    );
  }
}

/// Đường dẫn đến các trang
class RouteEntity {
  String path;
  Widget page;
  RouteEntity({
    required this.path,
    required this.page,
  });
}
