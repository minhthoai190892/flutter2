import 'package:flutter/material.dart';
import 'package:foodpanda_sellers_app/widgets/custom_text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextFieldWidget(
        isObserce: false,
        controller: _controller,
        iconData: Icons.phone,
        hintText: 'Phone Number',
      ),
    );
  }
}
