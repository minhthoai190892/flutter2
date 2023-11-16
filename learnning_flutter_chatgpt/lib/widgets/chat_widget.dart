import 'package:flutter/material.dart';
import 'package:learnning_flutter_chatgpt/constants/constaints.dart';
import 'package:learnning_flutter_chatgpt/services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Image.asset(
                  AssetsManager.botImage,
                  width: 30,
                  height: 30,
                ),
                const Text("data:"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
