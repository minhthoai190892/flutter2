import 'package:chatty/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

// import 'package:chatty/common/routes/routes.dart';
// import 'package:chatty/common/store/store.dart';

import 'package:get/get.dart';

import '../store/user.dart';

/// 检查是否登录
class RouteAuthMiddleware extends GetMiddleware {
  // priority 数字小优先级高
  @override
  int? priority = 0;

  RouteAuthMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    //
    if (UserStore.to.isLogin ||
        route == Routes.SIGN_IN ||
        route == Routes.WELCOME||
        route == Routes.MESSAGE) {
      return null;
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Get.snackbar("Tips", "Login expired, please login again!"));
      return const RouteSettings(name: Routes.SIGN_IN);
    }
  }
}
