import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EndListPage extends StatefulWidget {
  const EndListPage({Key? key}) : super(key: key);

  @override
  State<EndListPage> createState() => _EndListPageState();
}

class _EndListPageState extends State<EndListPage> {
  final _firestore = FirebaseFirestore.instance;


  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String useruid;
    useruid = user!.uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text("End List"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('users').doc('$useruid').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data!;
          final izlemekteOldugumDiziler = user['bitenDiziler'] ?? [];

          if (izlemekteOldugumDiziler.isEmpty) {
            return const Center(child: Text('Biten dizi yok'));
          }

          return ListView.builder(
            itemCount: izlemekteOldugumDiziler.length,
            itemBuilder: (context, index) {
              final dizi = izlemekteOldugumDiziler[index];

              return Card(
                child: ListTile(
                  title: Text(dizi['diziIsmi'].toString()),
                  subtitle: Text(
                    'Sezon Sayısı: ${dizi['sezonSayisi']}\nBölüm Sayısı: ${dizi['bolumSayisi']}',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}