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
    int _selectedIndex = 0;
     const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
     const List<Widget> _widgetOptions = <Widget>[
      Text(
        'Ana Sayfa',
        style: optionStyle,
      ),
      Text(
        'Tv',
        style: optionStyle,
      ),
      Text(
        'Login',
        style: optionStyle,
      ),
      Text(
        'Geçmiş',
        style: optionStyle,
      ),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        if (_selectedIndex == 0)
          {
            Navigator.push (
              context,
              MaterialPageRoute(builder: (context) => const Homapage()),
            );
          }
        if (_selectedIndex == 1)
        {
          Navigator.push (
            context,
            MaterialPageRoute(builder: (context) => const Homapage()),
          );
        }
        if (_selectedIndex == 2)
        {
          Navigator.push (
            context,
            MaterialPageRoute(builder: (context) =>  userpage()),
          );
        }
        if (_selectedIndex == 3)
        {
          Navigator.push (
            context,
            MaterialPageRoute(builder: (context) => const Homapage()),
          );
        }




      });
    }
    return Scaffold (
        appBar: AppBar(
          title: const Text('Ana Sayfa'),
        ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Business',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'School',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.border_color_outlined),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),


        // child: Center(child: ElevatedButton(
        //     style:
        //     ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        //     onPressed: () async {
        //
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) {
        //         return
        //            userpage();
        //       }
        //       ));
        //
        //     },
        //     child: const Text(
        //       "Üye Ol",
        //       style: TextStyle(fontSize: 25),
        //     )
        //
        // ),
        //
        // )
    );
  }
}



