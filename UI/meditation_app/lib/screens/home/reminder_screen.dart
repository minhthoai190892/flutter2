import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/common/color_extension.dart';
import 'package:meditation_app/common_widget/circle_button.dart';
import 'package:meditation_app/common_widget/common_widgets.dart';
import 'package:meditation_app/screens/home/home_screen.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List dayArr = [
    {'name': 'SU', 'is_select': false},
    {'name': 'M', 'is_select': false},
    {'name': 'T', 'is_select': false},
    {'name': 'W', 'is_select': false},
    {'name': 'TH', 'is_select': false},
    {'name': 'F', 'is_select': false},
    {'name': 'S', 'is_select': false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(minHeight: context.height - 180),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextWidget(
                      text: 'What time would you\nlike to meditate?',
                      color: TColor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextWidget(
                      text:
                          'Any time you choose but we recommend\nfirst thing in the morning',
                      color: TColor.secondaryText,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color(0xfff5f5f5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (value) {
                          print(value);
                        },
                        use24hFormat: false,
                        minuteInterval: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    TextWidget(
                      text: 'Which day would you\nlike to meditate?',
                      color: TColor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextWidget(
                      text:
                          'Everday is best, but we recommend picking at least five',
                      color: TColor.secondaryText,
                      fontSize: 16,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: dayArr
                          .map((day) => CircleButton(
                                title: day['name'],
                                isSelect: day['is_select'],
                                onPressed: () {
                                  setState(() {
                                    dayArr[dayArr.indexOf(day)]['is_select'] =
                                        !(day['is_select'] as bool? ?? false);
                                  });
                                },
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
              RoundButton(
                title: 'Save',
                onPressed: () => context.push(const HomeScreen()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: TextWidget(
                      text: 'NO THANKS',
                      color: TColor.primaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
