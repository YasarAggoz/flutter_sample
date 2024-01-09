
import 'package:dizi_takip/sekmeler/homepage.dart';
import 'package:dizi_takip/sekmeler/login.dart';
import 'package:dizi_takip/sekmeler/sign.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class main_page extends StatelessWidget {
  const main_page({Key? key}) : super(key: key);

  Future<void> main() async {

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),

        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Bağlantıda bir Sorun var."),) ;
          }
          else if (snapshot.hasData){
            print(" Giriş yap Çalıştı");
            return Homapage();

          } else {
            print("çalssss") ;
            return loginpage();

          }
        },

      ),


    );
  }
}