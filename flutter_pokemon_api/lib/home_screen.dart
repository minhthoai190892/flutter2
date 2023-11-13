import 'dart:convert';

import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Column(
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
                      return Card(
                        child: Text('${pokedex[index]['name']}'),
                      );
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
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
        print(pokedex[150]['name']);
      }
    });
  }
}
