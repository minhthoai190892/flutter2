import 'package:flutter/material.dart';
import 'package:learnning_flutter/constants/image_manager.dart';
import 'package:learnning_flutter/screens/horizontalscrolling/data/data.dart';
import 'package:learnning_flutter/screens/horizontalscrolling/widgets/animal_card.dart';
import 'package:learnning_flutter/widgets/app_appbar.dart';

class HorizontalScrolling extends StatelessWidget {
  const HorizontalScrolling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'HorizontalScrolling'),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: animals
            .map((animal) => buildAnimalCard(context,
                title: animal.title, imagePath: animal.imagePath))
            .toList(),
      ),
    );
  }

  FractionallySizedBox buildAnimalCard(BuildContext context,
      {String title = '', String imagePath = ''}) {
    return FractionallySizedBox(
        heightFactor: 0.35, child: AnimalCard(title: title, image: imagePath));
  }
}
