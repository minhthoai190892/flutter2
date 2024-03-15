import 'package:e_commerce_firebase/app/common/widgets/containers/circular_container.dart';
import 'package:e_commerce_firebase/app/utils/constants/colors.dart';
import 'package:e_commerce_firebase/app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor = THelperFuntions.getColor(value: text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor
            ? TCircularContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFuntions.getColor(value: text)!)
            : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: THelperFuntions.getColor(value: text),
        padding: isColor ? const EdgeInsets.all(0) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
      ),
    );
  }
}
