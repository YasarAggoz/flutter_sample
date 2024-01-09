import 'dart:convert';

import 'package:dizi_takip/service/recipeservice.dart';
import 'package:http/http.dart' as http;

class filterRecipeApi {
  filterRecipeApi(String search);

  static Future<List<Recipe>> searcgetRecipe(String title) async {

    if (title == null) {
      throw ArgumentError("service değişkeni null olamaz");
    }
    final uri = Uri.https('https://streaming-availability.p.rapidapi.com/search/title', {
      'title': title,
      'country': 'us',
    'show_type': 'series',
      'output_language': 'en'

    } as String);

    final response = await http.get(uri, headers: {
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

