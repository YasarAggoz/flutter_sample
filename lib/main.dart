import 'package:firebase_core/firebase_core.dart';
import 'package:dizi_takip/main_Page.dart';
import 'package:flutter/material.dart';
 Future <void> main() async {

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();


  runApp(MyApp());

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