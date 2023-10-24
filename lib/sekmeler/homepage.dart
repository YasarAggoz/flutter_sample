import 'package:dizi_takip/sekmeler/login.dart';
import 'package:dizi_takip/sekmeler/userpage.dart';
import 'package:flutter/material.dart';


class Homapage extends StatefulWidget {

  const Homapage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homapage> {

  @override
  Widget build(BuildContext context) {
    int _currentindex = 0 ;
    const colorizeColors = [
      Colors.indigo,
      Colors.blue,
      Colors.black38,
      Colors.blueGrey,
    ];
    const colorizeTextStyle = TextStyle(
      fontSize: 27.0,
      fontFamily: 'Smooch',
    );
    return Scaffold (
        appBar: AppBar(
          title: const Text('Ana Sayfa'),
        ),
        body: Center(child: ElevatedButton(
            style:
            ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () async {

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return
                   userpage();
              }
              ));

            },
            child: const Text(
              "Üye Ol",
              style: TextStyle(fontSize: 25),
            )

        ),

        )
    );
  }
}



