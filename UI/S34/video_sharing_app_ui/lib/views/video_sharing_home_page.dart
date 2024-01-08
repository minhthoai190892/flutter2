import 'package:flutter/material.dart';

class VideoSharingVideoHomePage extends StatelessWidget {
  const VideoSharingVideoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.1),
                    foregroundColor: Colors.white,
                    child: const Icon(Icons.search),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Video',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.1),
                    foregroundColor: Colors.white,
                  ),
                ],
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Your',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'favourites',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 48,
                      backgroundImage: NetworkImage(
                          'https://fastly.picsum.photos/id/40/4106/2806.jpg?hmac=MY3ra98ut044LaWPEKwZowgydHZ_rZZUuOHrc3mL5mI'),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Categories',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'on live',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: size.height / 1.7,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) => Container(
                            width: 260,
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 16),
                                      decoration: BoxDecoration(
                                          color: Colors.redAccent,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: const Text(
                                        'LIVE',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const Text(
                                      '1k2',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                const Text(
                                  'FLUTTER\nDEVELOPMENT',
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white),
                                ),
                                const Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('username'),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('2m'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Categories',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'on live',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: size.height / 3.2,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) => Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.access_time_outlined),
                                        Text('0:24')
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
