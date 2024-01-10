import 'package:flutter/material.dart';

class VideoStreamingPage extends StatefulWidget {
  const VideoStreamingPage({super.key});

  @override
  State<VideoStreamingPage> createState() => _VideoStreamingPageState();
}

class _VideoStreamingPageState extends State<VideoStreamingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://fastly.picsum.photos/id/32/4032/3024.jpg?hmac=n7I3OdGszMIwuGcvplNthgBmAxvAZ3rNBBSuDFZaItQ',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: size.height / 2,
              decoration: BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.2),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 10,
            bottom: 10,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        children: [
                          Text(
                            'Flutter developer',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Flutter',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: const ShapeDecoration(
                          color: Colors.deepOrangeAccent,
                          shape: StadiumBorder(),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: const Text(
                          'Follow',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: ShapeDecoration(
                          shape: const StadiumBorder(),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.visibility),
                            Text('1k'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => const Placeholder(),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: const TextField(),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const CircleAvatar(
                        radius: 24,
                      ),
                      const CircleAvatar(
                        radius: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
