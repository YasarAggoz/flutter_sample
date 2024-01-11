
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipeCard extends StatelessWidget {
  final String name;
  final int sezon;
  final int bolm;

  const RecipeCard({super.key, required this.name, required this.sezon, required this.bolm});

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
          Image.asset(

            'assets/resimler/blue.png',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
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


