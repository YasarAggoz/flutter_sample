
import 'package:dizi_takip/sekmeler/endlistpage.dart';
import 'package:dizi_takip/sekmeler/tabiipage.dart';
import 'package:dizi_takip/sekmeler/userpage.dart';
import 'package:dizi_takip/sekmeler/wachlist.dart';
import 'package:dizi_takip/service/rapidapi.dart';
import 'package:dizi_takip/widgetler/platformlar.dart';
import 'package:flutter/material.dart';

class Homapage extends StatefulWidget {

  const Homapage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homapage> {

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
        if (selectedIndex == 0)
          {
            Navigator.push (
              context,
              MaterialPageRoute(builder: (context) => const Homapage()),
            );
          }
        if (selectedIndex == 1)
        {
          Navigator.push (
            context,
            MaterialPageRoute(builder: (context) =>  wachlist()),
          );
        }
        if (selectedIndex == 2)
        {
          Navigator.push (
            context,
            MaterialPageRoute(builder: (context) =>  userpage()),
          );
        }
        if (selectedIndex == 3)
        {
          Navigator.push (
            context,
            MaterialPageRoute(builder: (context) => const EndListPage()),
          );
        }

      });
    }
    return Scaffold (

      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Column (

          children:  [
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only( top: 5,bottom: 5, ),
                decoration: BoxDecoration(color: const Color(0x00000073), borderRadius: BorderRadius.circular(4) ),
                child: Image.asset("assets/resimler/banner.png"),


              ),

            ),

             const SizedBox(height: 5,) ,
            platform("assets/resimler/net.png",'netflix', context),
            const SizedBox(height: 5,) ,
            platform("assets/resimler/prime.png",'prime.subscription', context),
            const SizedBox(height: 5,) ,
            platform("assets/resimler/hbo.png",'hbo,hulu.addon.hbo,prime.addon.hbomaxus', context ),
            const SizedBox(height: 5,) ,
            platform("assets/resimler/apple.png",'apple.addon',context),
            const SizedBox(height: 5,) ,
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Tabiipage()),
                );
              },
              child: Container(
                width: 300,
                height: 75,
                padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset("assets/resimler/tabii.png"),
              ),
            ),




         ],


        ),




      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'tvseries',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'login',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color_outlined),
            label: 'archive',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

    );
  }
}



