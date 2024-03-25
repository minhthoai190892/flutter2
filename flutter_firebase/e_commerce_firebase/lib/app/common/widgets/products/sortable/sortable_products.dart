
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../layouts/grid_layout.dart';
import '../product_cart/product_cart_vertical.dart';

class TSortableProducts extends StatelessWidget {
  /// Dropdown button and all products
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // !Dropdown button
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity',
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {
            print(value);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        TGridLayout(
          itemCount: 10,
          itemBuilder: (p0, p1) => const TProductCartVertical(),
        )
      ],
    );
  }
}
