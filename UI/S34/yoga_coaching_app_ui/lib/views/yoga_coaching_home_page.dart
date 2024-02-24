import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yoga_coaching_app_ui/utils/sizes.dart';

class YogaCoachingHomePage extends StatelessWidget {
  const YogaCoachingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(TSizes.size(context));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.face),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                            left: 16,
                            right: 16,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                height: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: -3,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Sign in',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 54,
                                  width: 54,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black),
                                  child: const Center(
                                      child: Text(
                                    'or',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  )),
                                )
                                // const CircleAvatar(
                                //   radius: 32,
                                //   backgroundColor: Colors.black,
                                //   foregroundColor: Colors.white,
                                //   child: Text('or'),
                                // ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 8,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                height: 24,
                                color: const Color(0xff7eb179),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff7eb179),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Search for guru',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Yoga\nclasses\from home',
                style: GoogleFonts.kronaOne(fontSize: 48, height: 1.1),
              ),
              Container(
                child: const Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
