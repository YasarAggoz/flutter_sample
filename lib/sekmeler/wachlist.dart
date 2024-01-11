
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class wachlist extends StatefulWidget {
  State<wachlist> createState() => _wachlistState();
}

class _wachlistState extends State<wachlist> {
  final _firestore = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String useruid;
    useruid = user!.uid;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Watch List"),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('users').doc('$useruid').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data!;
          final izlemekteOldugumDiziler = user['izlemekteOldugumDiziler'] ?? [];

          return ListView.builder(
            itemCount: izlemekteOldugumDiziler.length,
            itemBuilder: (context, index) {
              final dizi = izlemekteOldugumDiziler[index];

              return GestureDetector(
                onTap: () {
                  // Dropdown menu oluştur
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(dizi['diziIsmi'].toString()),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            // Sezon sayısı için dropdown menu
                            DropdownButtonFormField(
                              value: dizi['sezonSayisi'],
                              items: [
                                for (var i = 1; i <= dizi['sezonSayisi']; i++)
                                  DropdownMenuItem(
                                    value: i,
                                    child: Text(i.toString()),
                                  ),
                              ],
                              onChanged: (sezonSayisi) {
                                // Sezon sayısını güncelle
                                dizi['sezonSayisi'] = sezonSayisi;
                              },
                            ),
                            // Bölüm sayısı için dropdown menu
                            DropdownButtonFormField(
                              value: dizi['bolumSayisi'],
                              items: [
                                for (var i = 1; i <=dizi['bolumSayisi'] ; i++)
                                  DropdownMenuItem(
                                    value: i,
                                    child: Text(i.toString()),
                                  ),
                              ],
                              onChanged: (bolumSayisi) {
                                int bolumNo = bolumSayisi as int;
                                dizi['bolumSayisi'] = bolumSayisi;
                                Map<String, dynamic> kaldigimbolum = {
                                  'bolumNo': bolumNo,
                                };
                                dizi['kaldigimbolum'] = kaldigimbolum;

                                  _firestore
                                   .collection('users')
                                     .doc('$useruid')
                                      .update({
                                       'izlemekteOldugumDiziler': izlemekteOldugumDiziler
                                  });
                                Navigator.pop(context);
                              },
                            ),
                          Row(
                              children: [
                                if (dizi.containsKey('kaldigimbolum')) Text('Kaldığın Bölüm: ${dizi['kaldigimbolum']['bolumNo']}'),

                      ],

                      ),
                          ],

                        ),
                        actions: [
                          // Güncelle butonu
                          ElevatedButton(
                            onPressed: () {

                              _firestore
                                  .collection('users')
                                  .doc('$useruid')
                                  .update({
                                'izlemekteOldugumDiziler': FieldValue.arrayRemove([dizi])
                              });
                              Navigator.pop(context);
                            },
                            child: Text('Güncelle'),
                          ),
                        ],

                      );
                    },
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(dizi['diziIsmi'].toString()),
                    subtitle: Text(
                      'Sezon Sayısı: ${dizi['sezonSayisi']}\nBölüm Sayısı: ${dizi['bolumSayisi']}',
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Biten dizileri Firestore'a kaydet
                        _firestore
                            .collection('users')
                            .doc('$useruid')
                            .update({
                          'bitenDiziler': FieldValue.arrayUnion([dizi])
                        });
                        _firestore
                            .collection('users')
                            .doc('$useruid')
                            .update({
                          'izlemekteOldugumDiziler': FieldValue.arrayRemove([dizi])
                        });
                      },
                      child: Text('Bitti'),
                    ),
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