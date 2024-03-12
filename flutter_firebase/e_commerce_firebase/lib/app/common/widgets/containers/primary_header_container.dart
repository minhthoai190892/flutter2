import 'package:flutter/material.dart';

import '../../../modules/shop/homescreen/views/homescreen_view.dart';
import '../../../utils/constants/colors.dart';
import 'circular_container.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  /// Header
  ///
  /// vẽ đường border và 2 hình tròn bên phải
  ///
  /// [child] widget
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
      // chiều cao của header
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            // các hình tròn
            Positioned(
              top: -150,
              right: -250,
              // hình tròn
              child: TCircularContainer(
                  backgroundColor: TColors.white.withOpacity(0.1)),
            ),
            Positioned(
              top: 100,
              right: -300,
              // hình tròn
              child: TCircularContainer(
                  backgroundColor: TColors.white.withOpacity(0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
