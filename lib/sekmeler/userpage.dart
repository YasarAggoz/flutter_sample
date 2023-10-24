
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
  var _surName;
  var _tel;



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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Kullanıcı mail:",
                        style: TextStyle(
                            color: Color(0xFF1F1919),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        user!.email.toString(),
                        style: const TextStyle(
                            color: Color(0xFF1F1919),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      text("Kullanıcı Adı:"),
                      SizedBox(
                        width: 10,
                      ),

                      Text('deneme'),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      text("Kullanıcı Soyadı:"),
                      SizedBox(
                        width: 10,
                      ),
                      text( 'deneme'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      text("Kayıtlı Tel No:"),
                      SizedBox(
                        width: 10,
                      ),
                      text('5555555'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const loginpage()));
                      });
                    },
                    child: const Text("Çıkış Yap"),
                  ),

                ],
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget text(String txxt) {
  return Text(
    txxt,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  );
}