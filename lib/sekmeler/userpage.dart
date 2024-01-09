
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class userpage extends StatefulWidget {
  @override
  State<userpage> createState() => _userpageState();
}

class _userpageState extends State<userpage> {
  final user = FirebaseAuth.instance.currentUser;

  var _name;
  var _tel;
  var _surName;

  users() async {
    var ref = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    await ref.then((DocumentSnapshot value) async {
      if (mounted) {
        setState(() {
          _name = value.get("name").toString();
          _surName = value.get("surname").toString();
          _tel = value.get("tel");

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    users();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Sayfası"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/resimler/banner.png"), // Profil resmi için yer tutucu
                ),
                const SizedBox(height: 20),
                Text(
                  user!.displayName ?? "Kullanıcı Adı",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  user!.email ?? "Kullanıcı Mail",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Divider(thickness: 1),
                const SizedBox(height: 20),
                const Text(
                  "Kullanıcı Bilgileri",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildInfoRow("Kullanıcı Adı:", "$_name"),
                _buildInfoRow("Kullanıcı Soyadı:", "$_surName"),
                _buildInfoRow("Kayıtlı Tel No:", "$_tel"),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const loginpage()));
                    });
                  },
                  child: const Text("Çıkış Yap"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}