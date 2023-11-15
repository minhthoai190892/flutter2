import 'package:flutter/material.dart';

import '../constraints/image_manager.dart';

class TrendingNewsInfoWidget extends StatelessWidget {
  const TrendingNewsInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 3.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ImageManager.imageSports,
                fit: BoxFit.cover, width: 150, height: 150),
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'The edge of the RenderFlex that is he edge of the RenderFlex t',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'The edge of the RenderFlex that is he edge of the RenderFlex tThe edge of the RenderFlex that is he edge of the RenderFlex tThe edge of the RenderFlex that is he edge of the RenderFlex t',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
