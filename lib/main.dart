import 'package:dizi_takip/service/filtersservice.dart';
import 'package:dizi_takip/service/rapidapi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dizi_takip/main_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 Future <void> main() async {
String service1 = 'netflix';
String service2 = 'prime.subscription';
String service3= 'hbo,hulu.addon.hbo,prime.addon.hbomaxus';
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    fetchRecipes(service1);
    fetchRecipes(service2);
    fetchRecipes(service3);
    filterRecipeApi('batman');

  runApp(ProviderScope(child: MyApp()));

}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const main_page(),
    );
  }
}