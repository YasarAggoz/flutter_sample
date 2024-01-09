
import 'package:dizi_takip/model/cardmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uuid/uuid.dart';

import '../service/recipeapi.dart';
import '../service/recipeservice.dart';
class Netfilix extends StatefulWidget {
  final String photourl;

  final Uri uuri;

  const Netfilix(this.photourl,this.uuri,  {Key? key}) : super(key: key);

  @override
  _NetfilixState createState() => _NetfilixState();
}

class _NetfilixState extends State<Netfilix> {
  late List<Recipe> _recipes;
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    getRecipes();
  }


  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe(widget.uuri);
    setState(() {
      _isLoading = false;
    });
  }
  Future<void> searchgetrecipe() async {

    setState(() {
      _isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    String _searchTerm = '';
    bool _searchMode = false; // Arama modu için değişken

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.photourl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
        crossAxisCount: 2, // Yan yana 2 tane card için
        children: List.generate(
          _recipes.length,
              (index) {
            final filteredRecipe = _recipes.where((recipe) =>
            recipe.name.toLowerCase().contains(_searchTerm.toLowerCase()) ||
                recipe.sezon.toString().contains(_searchTerm.toLowerCase()) ||
                recipe.bolm.toString().contains(_searchTerm.toLowerCase()))
                .toList()[index];
            return RecipeCard(
              name: filteredRecipe.name,
              sezon: filteredRecipe.sezon,
              bolm: filteredRecipe.bolm,
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          ],
        ),
      ),
    );
  }
}