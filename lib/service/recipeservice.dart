class Recipe {

   final String name;
   final int sezon;
   final int bolm ;



     Recipe({ required this.name,required this.sezon, required this.bolm});

     factory Recipe.fromJson(dynamic json) {
    return Recipe(
         name: json['title'] as String,
         sezon: json['seasonCount'] as int ,
         bolm: json ['episodeCount'] as int
         );

  }
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }
  @override
  String toString(){
    return 'Recipe {title: $name} , seasonCount : $sezon , episodeCount : $bolm ';
  }
}
