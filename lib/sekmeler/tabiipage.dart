
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dizi_takip/model/cardmodel.dart';
import 'package:dizi_takip/model/tabiicard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uuid/uuid.dart';

import '../service/recipeapi.dart';
import '../service/recipeservice.dart';
class Tabiipage extends StatefulWidget {
  const Tabiipage({Key? key}) : super(key: key);

  @override
  _TabiiState createState() => _TabiiState();
}

class _TabiiState extends State<Tabiipage> {
  late List<Recipe> _recipes;
  bool _isLoading = true;
  Stream<QuerySnapshot>? _stream;
  final _firestore = FirebaseFirestore.instance;

  @override

  void initState() {
    super.initState();
    _stream = _firestore
        .collection('tabii')
        .doc('dizi')
        .collection('diziler')
        .snapshots();

  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String useruid;
    useruid = user!.uid;
    String _searchTerm = '';
    bool _searchMode = false;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/resimler/tabii.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('tabii').doc('dizi').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final diziler = snapshot.data!;
          final tabidizi = diziler['diziler'] ?? [];

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),

            itemCount: tabidizi.length,
            itemBuilder: (context, index) {
              final dizi = tabidizi[index];
              return RecipeCardtabi(
                name: dizi['diziIsmi'].toString(),
                sezon: dizi['sezonSayisi'],
                bolm: dizi['bolumSayisi'],
                imageurl: dizi['image'],
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  _searchMode = true;
                });
              },
            ),
            Visibility(
              visible: _searchMode,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ara',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.black),
                ),
                onChanged: (value) => _searchTerm = value, // Arama terimini güncelle
              ),
            ),
          ],
        ),
      ),
    );
  }
}