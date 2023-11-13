// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:learnning_flutter/constants/image_manager.dart';

class AnimalCard extends StatelessWidget {
  const AnimalCard({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      textAlign: TextAlign.center,
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Image.asset(
              image,
              width: 300,
              fit: BoxFit.cover,
            ))
          ],
        ),
      ),
    );
  }
}
