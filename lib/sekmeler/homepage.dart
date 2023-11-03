
import 'package:dizi_takip/sekmeler/userpage.dart';
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
            MaterialPageRoute(builder: (context) => const Homapage()),
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
            MaterialPageRoute(builder: (context) => const Homapage()),
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
            platform("assets/resimler/net.png", context),
            const SizedBox(height: 5,) ,
            platform("assets/resimler/prime.png", context),
            const SizedBox(height: 5,) ,
            platform("assets/resimler/hbo.png", context ),
            const SizedBox(height: 5,) ,
            platform("assets/resimler/exxen.png", context),
            const SizedBox(height: 5,) ,
            platform("assets/resimler/tabii.png",context ),

            // SizedBox(height: 10,) ,
            // Padding(padding: EdgeInsets.only(top: 10),
            // child: Container(
            //   width: 400,
            //   height: 100,
            //   padding: EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 30),
            //   decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(30)),
            //   child: Image.asset("assets/resimler/net.png"),
            // ),
            // ),


         ],

        ),
        // child: _widgetOptions.elementAt(selectedIndex),

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



