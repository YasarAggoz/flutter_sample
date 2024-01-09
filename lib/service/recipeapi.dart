import 'dart:convert';
import 'package:dizi_takip/service/recipeservice.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe(Uri uuri) async {
    print('Reccipe api içinde'+ uuri.toString());
    if (uuri == null) {

      throw ArgumentError("service değişkeni null olamaz");
    }
    // final uri = Uri.https('streaming-availability.p.rapidapi.com', '/search/filters', {
    //   'services': service,
    //   'country': 'us',
    //   'output_language': 'en',
    //   'show_type': 'series'
    // });

    final response = await http.get(uuri, headers: {
      'X-RapidAPI-Key': 'eac1c58a2amshf238eb1a168ed97p150e4bjsnc914ce30b42b',
      'X-RapidAPI-Host': 'streaming-availability.p.rapidapi.com',
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    if (data == null) {
      throw ArgumentError("service değişkeni null olamaz");
    }
    for (var i in data['result']) {
      _temp.add(i);
      //print(i["seasons"]);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
