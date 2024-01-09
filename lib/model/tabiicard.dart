
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeCardtabi extends StatelessWidget {
  final String name;
  final int sezon;
  final int bolm;
  // final String imageurl;

  const RecipeCardtabi ({super.key, required this.name, required this.sezon, required this.bolm,/* required this.imageurl*/});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    final String useruid;
    useruid = user!.uid;
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          //Image.network(

            //imageurl,
          //  width: double.infinity,
            //height: 200,
           // fit: BoxFit.cover,
         // ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Centered name
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                // Text details
                Text("Sezon:" + sezon.toString()),
                Text("Bölüm:" + bolm.toString()),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(88, 44),
              ),
              onPressed: () async {
                final userRef = firestore.collection('users').doc('$useruid');
                final user = await userRef.get();
                final izlemekteOldugumDiziler = user.data()!['izlemekteOldugumDiziler'] ?? [];
                izlemekteOldugumDiziler.addAll([
                  {
                    'diziIsmi': name,
                    'sezonSayisi': sezon,
                    'bolumSayisi': bolm,
                  },
                ]);
                await userRef.update({
                  'izlemekteOldugumDiziler': FieldValue.arrayUnion(izlemekteOldugumDiziler),
                });
              },
              icon: const Icon(Icons.add),
              label: const Text('Ekle'),
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RecipeCardtabi(name: 'dizi', sezon: 1, bolm: 1,/*imageurl: "gs://dizi-d26c0.appspot.com/1973.jpg",*/),
              RecipeCardtabi(name: 'dizi', sezon: 2, bolm: 2,/*imageurl: "gs://dizi-d26c0.appspot.com/1973.jpg"*/),
            ],
          ),
          // Alt alta 2 tane card
          Column(
            children: [
              RecipeCardtabi(name: 'dizi', sezon: 3, bolm: 3,/*imageurl: "gs://dizi-d26c0.appspot.com/1973.jpg"*/),
              RecipeCardtabi(name: 'dizi', sezon: 4, bolm: 4,/*imageurl: "gs://dizi-d26c0.appspot.com/1973.jpg"*/),
            ],
          ),
        ],
      ),
    );
  }
}
