
import 'package:flutter/material.dart';

import '../sekmeler/netflix.dart';

Widget platform ( String photourl, Uri uuri, context ) {
  return
    GestureDetector(
      onTap: (){
        print('platformlar içinde'+ uuri.toString());
        Navigator.push (
          context,
          MaterialPageRoute(builder: (context) =>  Netfilix(photourl,uuri)),
        );
  },
  child: Container(
  width: 300,
  height: 75,
  padding: const EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 20),
  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30)),
  child: Image.asset(photourl),
  ),
  );

}