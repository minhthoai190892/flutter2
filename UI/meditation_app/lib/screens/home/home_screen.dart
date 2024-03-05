import 'package:flutter/material.dart';

import '../../common/commons.dart';
import '../../common_widget/common_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List rArr = [
    {
      'image': 'assets/images/meditation_r1.jpeg',
      'title': 'Fou',
      'subtitle': 'MEDITATION . 3-10 MIN'
    },
    {
      'image': 'assets/images/meditation_r1.jpeg',
      'title': 'Happiness',
      'subtitle': 'MEDITATION . 3-10 MIN'
    },
    {
      'image': 'assets/images/meditation_r1.jpeg',
      'title': 'Fou',
      'subtitle': 'MEDITATION . 3-10 MIN'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Silent  '),
                  Image.asset(
                    'assets/images/logo-meditation.png',
                    width: 50,
                    height: 50,
                    // width: context.width * 0.5,
                  ),
                  const Text('  Moon'),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Good Morning, Afsar',
                      color: TColor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextWidget(
                      text: 'We wish you a good day',
                      color: TColor.secondaryText,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff8e97fd),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        'assets/images/icons8-meditation-16.png',
                                        width: 80,
                                        height: 80,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: 'Basics',
                                          color: TColor.tertiary,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextWidget(
                                          text: 'COURSE',
                                          color: TColor.tertiary,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextWidget(
                                              text: '3-10 MIN',
                                              color: TColor.tertiary,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18,
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: TColor.tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: TextWidget(
                                                  text: 'STRART',
                                                  color: TColor.primaryText,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff8e973d),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Image.asset(
                                        'assets/images/icons8-meditation-16.png',
                                        width: 80,
                                        height: 80,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: 'Relaxation',
                                          color: TColor.tertiary,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        TextWidget(
                                          text: 'MUSIC',
                                          color: TColor.tertiary,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextWidget(
                                              text: '3-10 MIN',
                                              color: TColor.tertiary,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18,
                                                        vertical: 8),
                                                decoration: BoxDecoration(
                                                  color: TColor.tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: TextWidget(
                                                  text: 'STRART',
                                                  color: TColor.primaryText,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color(0xff333242),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/icons8-meditation-80.png',
                            width: 80,
                            height: 80,
                            alignment: Alignment.topRight,
                            fit: BoxFit.fitWidth,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              children: [
                                const Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: 'Daily Thought',
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextWidget(
                                        text: 'Meditation . 3-10 MIN',
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextWidget(
                      text: 'Recommended for you',
                      color: TColor.primaryText,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.width * 0.35 * 0.7 + 60 + 40,
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var rObj = rArr[index];
                      return Container(
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.red),
                            color: Colors.grey.withOpacity(0.1)),
                        width: context.width * 0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                rObj['image'],
                                width: context.width * 0.35,
                                height: context.width * 0.35 * 0.7,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextWidget(
                              text: rObj['title'],
                              color: TColor.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            TextWidget(
                              text: rObj['subtitle'],
                              color: TColor.secondaryText,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 20,
                      );
                    },
                    itemCount: rArr.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
