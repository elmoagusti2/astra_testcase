import 'dart:convert';

import 'package:astra_testscase/models/pokemons/detail_pokemons/detail_pokemons.dart';
import 'package:astra_testscase/models/pokemons/pokemons/pokemons.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  Future<Pokemons> getPokemon() async {
    final response = await http.get(
      Uri.http(
        'pokeapi.co',
        '/api/v2/pokemon',
      ),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    return Pokemons.fromJson(jsonDecode(response.body));
  }

  Future<DetailPokemons> getDetailPokemon(int id) async {
    final response = await http.get(
      Uri.http('pokeapi.co', '/api/v2/pokemon/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    return DetailPokemons.fromJson(jsonDecode(response.body));
  }
}
