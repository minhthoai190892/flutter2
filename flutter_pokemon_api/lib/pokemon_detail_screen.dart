// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({
    Key? key,
    required this.color,
    required this.heroTag,
    required this.pokemonDetail,
  }) : super(key: key);
  final pokemonDetail;
  final Color color;
  final int heroTag;
  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var width2 = width / 2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
      ),
      backgroundColor: widget.color,
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              '${widget.pokemonDetail["name"]}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Text(
                widget.pokemonDetail['type'].join(', '),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.2,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PokemonInfo(
                        width: width,
                        widget: widget,
                        label: 'name',
                        text: 'name'),
                    PokemonInfo(
                        width: width,
                        widget: widget,
                        label: 'height',
                        text: 'height'),
                    PokemonInfo(
                        width: width,
                        widget: widget,
                        label: 'weight',
                        text: 'weight'),
                    PokemonInfo(
                        width: width,
                        widget: widget,
                        label: 'spawn_time',
                        text: 'spawn_time'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.white,
                          width: width * 0.3,
                          child: const Text(
                            'weaknesses',
                            style:
                                TextStyle(fontSize: 18, color: Colors.blueGrey),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: Text(
                            widget.pokemonDetail['weaknesses'].join(', '),
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          color: Colors.white,
                          width: width * 0.3,
                          child: const Text(
                            'weaknesses',
                            style:
                                TextStyle(fontSize: 18, color: Colors.blueGrey),
                          ),
                        ),
                        widget.pokemonDetail['next_evolution'] != null
                            ? SizedBox(
                                height: 20,
                                width: width * 0.55,
                                child: ListView.builder(
                                  itemCount: widget
                                      .pokemonDetail['next_evolution'].length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                        widget.pokemonDetail['next_evolution']
                                            [index]['name']);
                                  },
                                ),
                              )
                            : const Text('Maxed out'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.08,
            left: width2 - 100,
            child: Hero(
              tag: widget.heroTag,
              child: CachedNetworkImage(
                imageUrl: widget.pokemonDetail['img'],
                width: 200,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonInfo extends StatelessWidget {
  const PokemonInfo({
    super.key,
    required this.width,
    required this.widget,
    required this.label,
    required this.text,
  });

  final double width;
  final PokemonDetailScreen widget;
  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          color: Colors.white,
          width: width * 0.3,
          child: Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
          ),
        ),
        Container(
          color: Colors.white,
          child: Text(
            widget.pokemonDetail[text],
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
