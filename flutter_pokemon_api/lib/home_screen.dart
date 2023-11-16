import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon_api/pokemon_detail_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokemonApi =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
  List pokedex = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (mounted) {
      fetchPokemonDat();
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -50,
              right: -50,
              child: Image.asset(
                'images/pokeball.png',
                width: 300,
                fit: BoxFit.fitWidth,
              )),
          const Positioned(
            top: 100,
            left: 20,
            child: Text(
              'Pokedex',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: Column(
              children: [
                pokedex != null
                    ? Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1.4,
                            crossAxisCount: 2,
                          ),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            var type = pokedex[index]['type'][0];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PokemonDetailScreen(
                                        color: type == 'Grass'
                                            ? Colors.greenAccent
                                            : type == 'Fire'
                                                ? Colors.redAccent
                                                : type == 'Water'
                                                    ? Colors.blueAccent
                                                    : type == 'Electric'
                                                        ? Colors.yellowAccent
                                                        : type == 'Rock'
                                                            ? Colors.grey
                                                            : type == 'Ground'
                                                                ? Colors.brown
                                                                : type ==
                                                                        'Psychic'
                                                                    ? Colors
                                                                        .indigo
                                                                    : type ==
                                                                            'Fighting'
                                                                        ? Colors
                                                                            .orangeAccent
                                                                        : type ==
                                                                                'Bug'
                                                                            ? Colors.lightGreenAccent
                                                                            : type == 'Ghost'
                                                                                ? Colors.deepPurple
                                                                                : type == 'Normal'
                                                                                    ? Colors.black26
                                                                                    : type == 'Poison'
                                                                                        ? Colors.deepPurpleAccent
                                                                                        : Colors.pink,
                                        heroTag: index,
                                        pokemonDetail: pokedex[index],
                                      ),
                                    ));
                              },
                              child: Card(
                                color: type == 'Grass'
                                    ? Colors.greenAccent
                                    : type == 'Fire'
                                        ? Colors.redAccent
                                        : type == 'Water'
                                            ? Colors.blueAccent
                                            : type == 'Electric'
                                                ? Colors.yellowAccent
                                                : type == 'Rock'
                                                    ? Colors.grey
                                                    : type == 'Ground'
                                                        ? Colors.brown
                                                        : type == 'Psychic'
                                                            ? Colors.indigo
                                                            : type == 'Fighting'
                                                                ? Colors
                                                                    .orangeAccent
                                                                : type == 'Bug'
                                                                    ? Colors
                                                                        .lightGreenAccent
                                                                    : type ==
                                                                            'Ghost'
                                                                        ? Colors
                                                                            .deepPurple
                                                                        : type ==
                                                                                'Normal'
                                                                            ? Colors.black26
                                                                            : type == 'Poison'
                                                                                ? Colors.deepPurpleAccent
                                                                                : Colors.pink,
                                child: Stack(
                                  // alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      bottom: -5,
                                      right: -5,
                                      child: Image.asset(
                                        'images/pokeball.png',
                                        height: 100,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Positioned(
                                      top: 30,
                                      left: 10,
                                      child: Text(
                                        '${pokedex[index]['name']}',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Positioned(
                                      top: 50,
                                      left: 10,
                                      child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.black26,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(
                                              '$type',
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          )),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: Hero(
                                        tag: index,
                                        child: CachedNetworkImage(
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                            imageUrl: pokedex[index]['img']),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : const Text('data'),
              ],
            ),
          )
        ],
      ),
    );
  }

  void fetchPokemonDat() {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodeJsonData = jsonDecode(value.body);
        pokedex = decodeJsonData['pokemon'];
        setState(() {});
      }
    });
  }
}
