import 'package:dizi_takip/sekmeler/homepage.dart';
import 'package:dizi_takip/sekmeler/login.dart';
import 'package:dizi_takip/sekmeler/sign.dart';
import 'package:dizi_takip/service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class main_page extends StatelessWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: Colors.red,
      body: SafeArea(
        child: Stack(
          children: [
           Center(
             child:  ElevatedButton(
                 style:  ElevatedButton.styleFrom( primary: Colors.blue ), child: null,


                 onPressed:() async {
                   Navigator.push(
                       context, MaterialPageRoute(builder: (context) {
                     return
                       signpage();
                   }
                   )
                   );
                 }
             ),
           )
          ],
        )
      )

    );
  }
}