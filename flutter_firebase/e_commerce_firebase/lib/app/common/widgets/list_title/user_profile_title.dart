import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/t_circular_image.dart';

class TUserProfile extends StatelessWidget {
  /// ListTile
  ///
  /// [leading] avatar
  ///
  /// [title] user name
  ///
  /// [subtitle] email address
  ///
  /// [trailing] icon button
  const TUserProfile({
    super.key,
    required this.dark,
  });

  final bool dark;
//!TODO: MOdel
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
        dark: dark,
        image: TImages.user1,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'User Name 1',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        'support@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.edit,
            color: Colors.white,
          )),
    );
  }
}
