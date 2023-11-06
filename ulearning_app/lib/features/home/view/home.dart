import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/features/home/controller/home_controller.dart';

import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/search_widget.dart';
import '../widgets/home_widgets.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController controller;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(text: 'Home'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HelloText(),
              const UserName(),
              SizedBox(height: 20.h),
              searchBar(),
              SizedBox(height: 15.h),
              banner(ref: ref, controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
