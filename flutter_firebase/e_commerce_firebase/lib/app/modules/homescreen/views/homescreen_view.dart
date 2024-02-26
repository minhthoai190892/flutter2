import '../../../common/widgets/containers/curved_edges.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/widgets/containers/circular_container.dart';
import '../../../common/widgets/containers/primary_header_container.dart';
import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            TPrimaryHeaderContainer(
              child: Container(),
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
