

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
class Netfilix extends StatefulWidget {
 final String photourl ;
const Netfilix( this.photourl, {Key? key}) : super(key:key);
@override
_NetfilixState createState() => _NetfilixState();

}
class _NetfilixState extends State<Netfilix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only( top: 5,bottom: 5, ),
                decoration: BoxDecoration(color: const Color(0x00000073), borderRadius: BorderRadius.circular(4) ),
                child: Image.asset(widget.photourl),



              ),

            ),

          ],
        ),
      ),
    );

  }
}
