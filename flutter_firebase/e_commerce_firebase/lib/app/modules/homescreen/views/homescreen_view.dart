import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/appbar/app_bar_widget.dart';
import '../../../common/widgets/containers/curved_edges.dart';
import '../../../common/widgets/containers/primary_header_container.dart';
import '../../../common/widgets/product_cart/cart_menu_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';
import '../controllers/homescreen_controller.dart';
import 'widgets/home_appbar_widget.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: TAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //!TODO: app bart
                  THomeAppBar()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TCurveEdgeWidget extends StatelessWidget {
  const TCurveEdgeWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //!TODO: vẻ border
      clipper: TCustomeCurvedEdges(),
      child: child,
    );
  }
}
