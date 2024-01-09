
import 'package:dizi_takip/sekmeler/endlistpage.dart';
import 'package:dizi_takip/sekmeler/tabiipage.dart';
import 'package:dizi_takip/sekmeler/userpage.dart';
import 'package:dizi_takip/sekmeler/wachlist.dart';
import 'package:dizi_takip/service/rapidapi.dart';
import 'package:dizi_takip/widgetler/platformlar.dart';
import 'package:flutter/material.dart';

import 'netflix.dart';

class Homapage extends StatefulWidget {

  const Homapage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}
class _HomepageState extends State<Homapage> {

  @override
  Widget build(BuildContext context) {
    String name = "";
    Uri netuuri = Uri.https("streaming-availability.p.rapidapi.com", "/search/filters", {
      "services": "netflix",
      "country": "us",
      "output_language": "en",
      "show_type": "series"
    });
    Uri primeuuri = Uri.https("streaming-availability.p.rapidapi.com", "/search/filters", {
      "services": "prime.subscription",
      "country": "us",
      "output_language": "en",
      "show_type": "series"
    });
    Uri hbouuri = Uri.https("streaming-availability.p.rapidapi.com", "/search/filters", {
      "services": "hbo,hulu.addon.hbo,prime.addon.hbomaxus",
      "country": "us",
      "output_language": "en",
      "show_type": "series"
    });
    Uri appleuuri = Uri.https("streaming-availability.p.rapidapi.com", "/search/filters", {
      "services": "apple.addon",
      "country": "us",
      "output_language": "en",
      "show_type": "series"
    });


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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: SingleChildScrollView(
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

               const SizedBox(height: 10,) ,
              platform("assets/resimler/net.png", netuuri, context),
              const SizedBox(height: 10,) ,
              platform("assets/resimler/prime.png",primeuuri, context),
              const SizedBox(height: 10,) ,
              platform("assets/resimler/hbo.png",hbouuri, context ),
              const SizedBox(height: 10,) ,
              platform("assets/resimler/apple.png",appleuuri,context),
              const SizedBox(height: 10,) ,
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
              const SizedBox(height: 15,) ,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: Colors.black87
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(

                        title: Text('Arama'),
                        content: TextField(
                          onChanged: (value) {
                            setState(() {
                              name = value; // Assign the input value to the `name` variable
                            });
                          },
                        ),
                        actions: [
                          ElevatedButton(

                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Kapat'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Uri titleuuri = Uri.https("streaming-availability.p.rapidapi.com", "/search/title", {
                                "title":"$name",
                                "country": "us",
                                "show_type": "series",
                                "output_language": "en"

                              });
                              Navigator.push (
                                context,
                                MaterialPageRoute(builder: (context) =>  Netfilix("assets/resimler/banner.png", titleuuri)),
                              );

                            },
                            child: Text('Ara'),
                          ),
                        ],
                      );
                    },
                  );
                },

                child: Icon(Icons.search),
              ),


           ],


          ),
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



