import 'package:flutter/material.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';

import '../utils/app_colors.dart';

AppBar buildAppBar({String text = ''}) => AppBar(
      title: Text16Normal(text: text, color: AppColors.primaryText),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(10), // Chiều cao của AppBar
        child: Container(
          height: 1,
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
    );
