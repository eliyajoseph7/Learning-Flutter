import 'package:galleryapp/screens/add_image.dart';
import 'package:galleryapp/screens/favourates.dart';
import 'package:galleryapp/screens/gallery.dart';
import 'package:galleryapp/screens/settings.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _initialIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Fresh Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingPage()));
            },
          )
        ],
        elevation: 0.0,
      ),
      body: tabView(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.indigo,
        items: [
          // TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.home, title: 'Home'),
          // TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.favorite, title: 'Favourates'),
        ],
        initialActiveIndex: _initialIndex, //optional, default as 0
        onTap: (int i) {
          setState(() {
            this._initialIndex = i;
          });
        },
      ),
    );
  }

  Widget tabView() {
    var index = _initialIndex;
    switch (index) {
      case 0:
        {
          return AddToGallery();
        }
        break;

      case 1:
        {
          return MyGallery();
        }
        break;

      default:
        {
          return MyFavourates();
        }
        break;
    }
  }
}
