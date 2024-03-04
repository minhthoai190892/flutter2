import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common/commons.dart';
import 'package:meditation_app/common_widget/common_widgets.dart';

class ChoiceTopicScreen extends StatefulWidget {
  const ChoiceTopicScreen({super.key});

  @override
  State<ChoiceTopicScreen> createState() => _ChoiceTopicScreenState();
}

class _ChoiceTopicScreenState extends State<ChoiceTopicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextWidget(
                            text: 'What Brings you',
                            color: TColor.primaryText,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    TextWidget(
                      text: 'to Silent Moon?',
                      color: TColor.primaryText,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextWidget(
                      text: 'choose a topic focused on:',
                      color: TColor.secondaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              )),
          Expanded(
              child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            itemCount: TImage.dataArr.length,
            itemBuilder: (context, index) {
              var height = index % 4 == 0 || index % 4 == 2
                  ? context.width * 0.55
                  : context.width * 0.45;
              var cObj = TImage.dataArr[index] as Map? ?? {};
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(4),
                height: height,
                decoration: BoxDecoration(
                  color: HexColor.formHex(cObj['color']),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  // alignment: Alignment.topCenter,
                  children: [
                    ClipRRect(
                      
                      borderRadius: BorderRadius.circular(10),
                      child: Lottie.asset(
                        cObj['image'],
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        height: height,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  cObj['title'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor.formHex(
                                      cObj['text_color'],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )),
          const Text('data'),
        ],
      ),
    );
  }
}
