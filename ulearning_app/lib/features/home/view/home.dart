import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/widgets/image_widgets.dart';

import '../../../common/widgets/search_widget.dart';
import '../controller/home_controller.dart';
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
      backgroundColor: Colors.white,
      appBar: homeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              const HelloText(),
              const UserName(),
              SizedBox(height: 20.h),
              searchBar(),
              SizedBox(height: 15.h),
              HomeBanner(controller: controller, ref: ref),
              const HomeMenuBar(),
              const CourseItemGrid()
            ],
          ),
        ),
      ),
    );
  }
}

class CourseItemGrid extends StatelessWidget {
  const CourseItemGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 40, mainAxisSpacing: 40),
        itemCount: 20,
        itemBuilder: (context, index) => appImage(),
      ),
    );
  }
}
